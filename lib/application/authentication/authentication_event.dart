part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.authCheck() = _AuthCheck;
  const factory AuthenticationEvent.loggedIn(Login login) = _LoggedIn;
  const factory AuthenticationEvent.loggedOut() = _LoggedOut;
}