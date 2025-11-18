import 'package:masrofy/screens/transaction/model.dart';

abstract class TransactionState {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final String message;

  const TransactionSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TransactionError extends TransactionState {
  final String message;

  const TransactionError(this.message);

  @override
  List<Object> get props => [message];
}

class TransactionCreated extends TransactionState {
  final TransactionModel transaction;

  const TransactionCreated(this.transaction);

  @override
  List<Object> get props => [transaction];
}
