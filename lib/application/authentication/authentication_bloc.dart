import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/auth_facade.dart';
import 'package:youapp_test/domain/login/models/login.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthFacade _repository;
  AuthenticationBloc(this._repository) : super(const _Initial()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.when(
        authCheck: () async {
          return (await _repository.authCheck()).fold(
              (l) => emit(const AuthenticationState.unauthenticated()),
              (r) => emit(const AuthenticationState.authenticated()));
        },
        loggedIn: (login) async {
          return (await _repository.loggedIn(login)).fold(
              (l) => emit(const AuthenticationState.unauthenticated()),
              (r) => emit(const AuthenticationState.authenticated()));
        },
        loggedOut: () async {
          return (await _repository.loggedOut()).fold(
              (l) => emit(const AuthenticationState.unauthenticated()),
              (r) => emit(const AuthenticationState.unauthenticated()));
        },
      );
    });
  }
}
