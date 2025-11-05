import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  Future<void> sendPhoneCode(String phoneNumber) async {
    emit(AuthLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(AuthSuccess());
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

  Future<void> verifyOtp(String otpCode) async {
    emit(AuthLoading());
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otpCode,
      );
      await _auth.signInWithCredential(credential);
      emit(AuthSuccess());
    } 
    
    catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
  }

  // 🔹 Google Sign-In
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.authenticate();

      if (googleUser == null) {
        emit(AuthFailure(errmessage: 'Sign in cancelled by user'));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errmessage: e.message ?? 'Firebase Auth Error'));
    } on Exception catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
  }

 
}
