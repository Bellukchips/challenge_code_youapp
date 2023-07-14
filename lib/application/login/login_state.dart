part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
          {required LoginForm form,
          required bool passwordVisibility,
          required bool isSubmitting,
          required Option<Either<AuthFailure, Login>> loginFailureOption}) =
      _LoginState;
  factory LoginState.initial() => LoginState(
      form: LoginForm(
          email: FormEmailValue(''), password: FormPasswordConfirmValue('')),
      passwordVisibility: false,
      isSubmitting: false,
      loginFailureOption: none());
}
