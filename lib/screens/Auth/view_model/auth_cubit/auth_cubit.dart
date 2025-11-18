import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;

  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // GETTERS
  User? get currentUser => auth.currentUser;
  String? get currentUserId => auth.currentUser?.uid;

  /// -----------------------------------------------------
  /// 🔥 Create user in Firestore (ONLY first time)
  /// -----------------------------------------------------
  Future<void> _createUserIfNotExists(User user) async {
    final doc = firestore.collection('users').doc(user.uid);

    final exists = await doc.get();
    if (!exists.exists) {
      await doc.set({
        'uid': user.uid,
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'phone': user.phoneNumber ?? '',
        'photo': user.photoURL ?? '',
        'provider':
            user.providerData.isNotEmpty
                ? user.providerData[0].providerId
                : 'phone',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  /// -----------------------------------------------------
  /// 📞 Send phone code
  /// -----------------------------------------------------
  Future<void> sendPhoneCode(String phoneNumber) async {
    emit(AuthLoading());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          final user = auth.currentUser!;
          await _createUserIfNotExists(user);
          emit(AuthSuccess(user: user));
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(
            AuthFailure(errmessage: e.message ?? "Phone verification failed"),
          );
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
          emit(AuthCodeSent());
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
      );
    } catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
  }

  /// -----------------------------------------------------
  /// 🔢 Verify OTP
  /// -----------------------------------------------------
  Future<void> verifyOtp(String otpCode) async {
    emit(AuthLoading());
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otpCode,
      );

      await auth.signInWithCredential(credential);
      final user = auth.currentUser!;
      await _createUserIfNotExists(user);

      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
  }

  /// -----------------------------------------------------
  /// 🔵 Google Sign-in
  /// -----------------------------------------------------
  Future<User?> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user!;
      await _createUserIfNotExists(user);

      emit(AuthSuccess(user: user));
      return user;
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errmessage: e.message ?? 'Firebase Auth Error'));
    } catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
    return null;
  }

  /// -----------------------------------------------------
  /// 🚪 Sign Out
  /// -----------------------------------------------------
  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
    } catch (_) {}

    await auth.signOut();
    emit(AuthInitial());
  }

  void checkLogin() {
    emit(AuthInitial());
  }

  bool get isLoggedIn => auth.currentUser != null;
}
