import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';
import 'package:youapp_test/domain/profile/profile_facade.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileFacade _repository;
  ProfileBloc(this._repository) : super(const _Initial()) {
    on<_GetProfile>((event, emit) async {
      emit(const ProfileState.loadInProgress());
      return (await _repository.getProfile())
          .fold((l) => emit(ProfileState.loadFailure(l)), (r) {
        emit(ProfileState.loadSuccess(r));
      });
    });
    on<_NotReceived>((event, emit) {
      emit(event.failureOrNot.fold((l) => ProfileState.loadFailure(l),
          (r) => ProfileState.loadSuccess(r)));
    });
  }
}
