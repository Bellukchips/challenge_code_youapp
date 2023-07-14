import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/domain/core/value/form/form_email_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_confirm_value.dart';
part 'login_form.freezed.dart';

@freezed
abstract class LoginForm with _$LoginForm {
  const LoginForm._();
  const factory LoginForm({
    required FormEmailValue email,
    required FormPasswordConfirmValue password,
  }) = _LoginForm;

  factory LoginForm.empty() => LoginForm(
      email: FormEmailValue(''), password: FormPasswordConfirmValue(''));
}
