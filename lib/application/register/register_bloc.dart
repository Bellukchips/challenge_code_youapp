import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:youapp_test/domain/core/value/form/form_email_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_confirm_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_value.dart';
import 'package:youapp_test/domain/core/value/form/form_username_value.dart';
import 'package:youapp_test/domain/register/failure/register_failure.dart';
import 'package:youapp_test/domain/register/models/register_form.dart';
import 'package:youapp_test/domain/register/register_facade.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterFacade _repository;
  RegisterBloc(
    this._repository,
  ) : super(RegisterState.initial()) {
    on<_Started>((event, emit) {
      emit(state.copyWith(
        isSubmitting: false,
        registerForm: RegisterForm.empty(),
        registerFailureSuccessOption: none(),
      ));
    });
    on<_EmailChanged>(
      (event, emit) {
        final email = FormEmailValue(event.value);
        emit(state.copyWith(
            registerForm: state.registerForm.copyWith(email: email)));
      },
    );
    on<_UsernameChanged>((event, emit) {
      final username = FormUsernameValue(event.value);
      emit(state.copyWith(
          registerForm: state.registerForm.copyWith(username: username)));
    });
    on<_PasswordChangedCreate>((event, emit) {
      final password = FormPasswordValue(event.value);
      emit(state.copyWith(
          registerForm: state.registerForm.copyWith(password: password)));
    });
    on<_PasswordChangedConfirm>((event, emit) {
      final passwordConfirm = FormPasswordConfirmValue(event.value);
      emit(state.copyWith(
          registerForm:
              state.registerForm.copyWith(passwordConfirm: passwordConfirm)));
    });
    on<_TogglePasswordCreate>((event, emit) {
      emit(state.copyWith(
          passwordVisibilityCreate: !state.passwordVisibilityCreate));
    });
    on<_TogglePasswordConfirm>((event, emit) {
      emit(state.copyWith(
          passwordVisibilityConfirm: !state.passwordVisibilityConfirm));
    });
    on<_Submit>((event, emit) async {
      late Either<RegisterFailure, String> failureOption;
      final emailValid = state.registerForm.email?.isValid();
      final usernameValid = state.registerForm.username?.isValid();
      final passwordValid = state.registerForm.password?.isValid();
      final passwordConfirmValid =
          state.registerForm.passwordConfirm?.isValid();
      state.registerForm.passwordConfirm?.isValid();

      if (emailValid! &&
          usernameValid! &&
          passwordValid! &&
          passwordConfirmValid!) {
        emit(state.copyWith(
            isSubmitting: true, registerFailureSuccessOption: none()));
        failureOption = await _repository.register(RegisterForm(
            email: state.registerForm.email,
            username: state.registerForm.username,
            password: state.registerForm.password,
            passwordConfirm: state.registerForm.passwordConfirm));
      }
      emit(state.copyWith(
          isSubmitting: false,
          registerFailureSuccessOption: some(failureOption)));
    });
  }
}
