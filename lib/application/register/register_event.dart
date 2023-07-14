part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.emailChanged(String value) = _EmailChanged;
  const factory RegisterEvent.usernameChanged(String value) = _UsernameChanged;
  const factory RegisterEvent.passwordChangedCreate(String value) =
      _PasswordChangedCreate;
  const factory RegisterEvent.passwordChangedConfirm(String value) =
      _PasswordChangedConfirm;
  const factory RegisterEvent.togglePasswordCreate() = _TogglePasswordCreate;
  const factory RegisterEvent.togglePasswordConfirm() = _TogglePasswordConfirm;
  const factory RegisterEvent.submit(RegisterForm form) = _Submit;
}
