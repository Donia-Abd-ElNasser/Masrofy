import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  String _getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Login failed. Please try again.';
    }
  }

  
}
