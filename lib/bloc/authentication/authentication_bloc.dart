import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/repository/authentication_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAthenticationRepository authenticationRepository = locator.get();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthStateLoading());
      var response = await authenticationRepository.login(
        event.username,
        event.password,
      );

      emit(AuthResponseState(response));
    });
  }
}
