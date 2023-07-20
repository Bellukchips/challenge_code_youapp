part of 'profile_form_bloc.dart';

@freezed
class ProfileFormEvent with _$ProfileFormEvent {
  const factory ProfileFormEvent.started() = _Started;
  const factory ProfileFormEvent.nameChanged(String value) = _NameChanged;
  const factory ProfileFormEvent.birthdayChanged(String value) = _BirthdayChanged;
  const factory ProfileFormEvent.heightChanged(int value) = _HeightChanged;
  const factory ProfileFormEvent.weightChanged(int value) = _WeightChanged;
  const factory ProfileFormEvent.interestChanged(List<String> interests) = _InterestChanged;
  const factory ProfileFormEvent.createProfile(ProfileForm form) = _CreateProfile;
  const factory ProfileFormEvent.updateProfile(ProfileForm form) = _UpdateProfile;
  const factory ProfileFormEvent.updateInterests(List<String> interests) = _UpdateInterests;
}