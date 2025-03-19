part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class AuthStateLoading extends AuthenticationState {}

class AuthResponseState extends AuthenticationState {
  Either<String, String> response;

  AuthResponseState(this.response);
}
