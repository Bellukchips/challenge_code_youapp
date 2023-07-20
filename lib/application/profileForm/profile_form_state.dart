part of 'profile_form_bloc.dart';

@freezed
class ProfileFormState with _$ProfileFormState {
  const factory ProfileFormState({
    required ProfileForm form,
    required List<String> interests,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Profile>> createProfileFailureOption,
  }) = _ProfileFormState;
  factory ProfileFormState.initial() => ProfileFormState(
      form: ProfileForm(
        name: FormSingleLineValue(''),
        birthday: FormBirthdayValue(''),
        height: FormIntegerValue(0),
        weight: FormIntegerValue(0),
      ),
      interests: [],
      createProfileFailureOption: none(),
      isSubmitting: false);
}
