import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final String errmessage;
  const AuthFailure({required this.errmessage});
}

class AuthCodeSent extends AuthState {}
