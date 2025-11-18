import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:masrofy/screens/transaction/model.dart';

import 'package:masrofy/screens/transaction/view_model/states.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final FirebaseFirestore _firestore;
  final Connectivity _connectivity;
  StreamSubscription? _connectivitySubscription;

  TransactionCubit({FirebaseFirestore? firestore, Connectivity? connectivity})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _connectivity = connectivity ?? Connectivity(),
      super(TransactionInitial()) {
    _initConnectivityListener();
  }

  void _initConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      result,
    ) {
      if (result == ConnectivityResult.none) {
        emit(TransactionError('No internet connection'));
      } else {
        emit(TransactionSuccess('Connection restored'));
      }
    });
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  // Create transaction with user authentication
  Future<void> createTransaction({
    required String userId, // Get this from AuthCubit
    required double amount,
    required String description,
    required String category,
    required String currency,
    required String transactionType,
    required String repetition,
    required DateTime date,
  }) async {
    try {
      if (!await _checkInternetConnection()) {
        emit(TransactionError('No internet connection'));
        return;
      }

      emit(TransactionLoading());

      final transaction = TransactionModel(
        userId: userId, // Use the authenticated user's ID
        amount: amount,
        description: description,
        category: category,
        currency: currency,
        transactionType: transactionType,
        repetition: repetition,
        date: date,
      );

      final docRef = await _firestore
          .collection('transactions')
          .add(transaction.toMap());

      final transactionWithId = transaction.copyWith(id: docRef.id);

      emit(TransactionCreated(transactionWithId));
      await Future.delayed(const Duration(milliseconds: 100));
      emit(TransactionSuccess('Transaction added successfully!'));
    } on FirebaseException catch (e) {
      emit(TransactionError('Firebase error: ${e.message}'));
    } on TimeoutException catch (e) {
      emit(TransactionError('Connection timeout: ${e.message}'));
    } catch (e) {
      emit(TransactionError('Failed to add transaction: $e'));
    }
  }

  // Get transactions for specific user

  Stream<List<TransactionModel>> getTransactions(String userId) {
    return _firestore
        .collection('transactions')
        .where('userId', isEqualTo: userId) // Filter by user ID
        .orderBy('date', descending: true)
        .snapshots()
        .handleError((error) {
          print('Firestore stream error: $error');
        })
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => TransactionModel.fromMap(doc.id, doc.data()))
                  .toList(),
        );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
