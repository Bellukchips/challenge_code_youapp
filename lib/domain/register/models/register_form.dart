import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/domain/core/value/form/form_email_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_confirm_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_value.dart';
import 'package:youapp_test/domain/core/value/form/form_username_value.dart';
part 'register_form.freezed.dart';

@freezed
abstract class RegisterForm with _$RegisterForm {
  const RegisterForm._();
  const factory RegisterForm({
    required FormEmailValue? email,
    required FormUsernameValue? username,
    required FormPasswordValue? password,
    required FormPasswordConfirmValue? passwordConfirm,
  }) = _RegisterForm;

  factory RegisterForm.empty() => RegisterForm(
      email: FormEmailValue(''),
      username: FormUsernameValue(''),
      password: FormPasswordValue(''),
      passwordConfirm: FormPasswordConfirmValue(''));
}
