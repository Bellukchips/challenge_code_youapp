part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState(
      {required RegisterForm registerForm,
      required bool passwordVisibilityCreate,
      required bool passwordVisibilityConfirm,
      required bool isSubmitting,
      required Option<Either<RegisterFailure, String>>
          registerFailureSuccessOption}) = _RegisterState;
  factory RegisterState.initial() => RegisterState(
      registerForm: RegisterForm(
          email: FormEmailValue(''),
          username: FormUsernameValue(''),
          password: FormPasswordValue(''),
          passwordConfirm: FormPasswordConfirmValue('')),
      passwordVisibilityCreate: false,
      passwordVisibilityConfirm: false,
      isSubmitting: false,
      registerFailureSuccessOption: none());
}
