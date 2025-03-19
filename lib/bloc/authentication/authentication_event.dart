part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthLoginRequest extends AuthenticationEvent {
  String username;
  String password;

  AuthLoginRequest(this.username, this.password);
}
