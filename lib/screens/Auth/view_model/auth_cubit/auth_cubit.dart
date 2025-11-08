import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;

  Future<void> sendPhoneCode(String phoneNumber) async {
    emit(AuthLoading());
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
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
      await auth.signInWithCredential(credential);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errmessage: e.toString()));
    }
  }

  Future<User?> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

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
     emit(AuthSuccess());
     //return userCredential.user;
    } on FirebaseAuthException catch (e) {
    emit(AuthFailure(errmessage: e.message ?? 'Firebase Auth Error'));
  } catch (e) {
    emit(AuthFailure(errmessage: e.toString()));
  }
  }
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await auth.signOut();
  }
}
