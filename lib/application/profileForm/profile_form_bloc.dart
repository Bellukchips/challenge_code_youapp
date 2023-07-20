import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/core/value/form/form_birthday_value.dart';
import 'package:youapp_test/domain/core/value/form/form_integer_value.dart';
import 'package:youapp_test/domain/core/value/form/form_single_line.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';
import 'package:youapp_test/domain/profile/models/profile_form.dart';
import 'package:youapp_test/domain/profile/profile_facade.dart';

part 'profile_form_event.dart';
part 'profile_form_state.dart';
part 'profile_form_bloc.freezed.dart';

@injectable
class ProfileFormBloc extends Bloc<ProfileFormEvent, ProfileFormState> {
  final ProfileFacade _repository;
  ProfileFormBloc(this._repository) : super(ProfileFormState.initial()) {
    on<_Started>((event, emit) {
      emit(state.copyWith(
        createProfileFailureOption: none(),
        isSubmitting: false,
        form: ProfileForm.empty(),
      ));
    });
    on<_NameChanged>((event, emit) {
      final name = FormSingleLineValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(name: name)));
    });
    on<_BirthdayChanged>((event, emit) {
      final birthday = FormBirthdayValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(birthday: birthday)));
    });
    on<_HeightChanged>((event, emit) {
      final height = FormIntegerValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(height: height)));
    });
    on<_WeightChanged>((event, emit) {
      final weight = FormIntegerValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(weight: weight)));
    });
    on<_InterestChanged>((event, emit) {
      emit(state.copyWith(interests: event.interests));
    });
    on<_CreateProfile>((event, emit) async {
      late Either<AuthFailure, Profile> failureOption;
      final nameValid = state.form.name!.isValid();
      final birthdayValid = state.form.birthday!.isValid();
      final heightValid = state.form.height!.isValid();
      final weightValid = state.form.weight!.isValid();

      if (nameValid && birthdayValid && heightValid && weightValid) {
        emit(state.copyWith(
            isSubmitting: true, createProfileFailureOption: none()));
        failureOption = await _repository.createProfile(
          ProfileForm(
              name: state.form.name,
              birthday: state.form.birthday,
              height: state.form.height,
              weight: state.form.weight),
        );

        emit(state.copyWith(
            isSubmitting: false,
            createProfileFailureOption: some(failureOption)));
      }
    });
    on<_UpdateProfile>((event, emit) async {
      late Either<AuthFailure, Profile> failureOption;
      final nameValid = state.form.name!.isValid();
      final birthdayValid = state.form.birthday!.isValid();
      final heightValid = state.form.height!.isValid();
      final weightValid = state.form.weight!.isValid();

      if (nameValid && birthdayValid && heightValid && weightValid) {
        emit(state.copyWith(
            isSubmitting: true, createProfileFailureOption: none()));
        failureOption = await _repository.updateProfile(
          ProfileForm(
              name: state.form.name,
              birthday: state.form.birthday,
              height: state.form.height,
              weight: state.form.weight),
        );

        emit(state.copyWith(
            isSubmitting: false,
            createProfileFailureOption: some(failureOption)));
      }
    });
    on<_UpdateInterests>((event, emit) async {
      late Either<AuthFailure, Profile> failureOption;
      emit(state.copyWith(
          isSubmitting: true, createProfileFailureOption: none()));
      failureOption = await _repository.updateInterest(state.interests);
      emit(state.copyWith(
          isSubmitting: false,
          createProfileFailureOption: some(failureOption)));
    });
  }
}
