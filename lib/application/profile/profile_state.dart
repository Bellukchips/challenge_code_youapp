part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loadInProgress() = _LoadInProgress;
  const factory ProfileState.loadSuccess(Profile profile) = _LoadSuccess;
  const factory ProfileState.loadFailure(AuthFailure failure) = _LoadFailure;
  const factory ProfileState.loadEmpty() = _LoadEmpty;
}
