part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.emailChanged(String value) = _EmailChanged;
  const factory LoginEvent.passwordChanged(String value) = _PasswordChanged;
  const factory LoginEvent.togglePassword() = _TogglePassword;
  const factory LoginEvent.submit(LoginForm form) = _Submit;
}
