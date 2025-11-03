


abstract class AuthState {}
class AuthCodeSent extends AuthState {}
final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthFailure extends AuthState {


  final String errmessage;

  AuthFailure({required this.errmessage});
}