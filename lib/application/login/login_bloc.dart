import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/core/value/form/form_email_value.dart';
import 'package:youapp_test/domain/core/value/form/form_password_confirm_value.dart';
import 'package:youapp_test/domain/login/login_facade.dart';
import 'package:youapp_test/domain/login/models/login.dart';
import 'package:youapp_test/domain/login/models/login_form.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginFacade _repository;
  LoginBloc(this._repository) : super(LoginState.initial()) {
    on<_Started>((event, emit) {
      emit(state.copyWith(
        form: LoginForm.empty(),
        isSubmitting: false,
        loginFailureOption: none(),
      ));
    });
    on<_EmailChanged>((event, emit) {
      final email = FormEmailValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(email: email)));
    });
    on<_PasswordChanged>((event, emit) {
      final password = FormPasswordConfirmValue(event.value);
      emit(state.copyWith(form: state.form.copyWith(password: password)));
    });
    on<_TogglePassword>((event, emit) {
      emit(state.copyWith(passwordVisibility: !state.passwordVisibility));
    });
    on<_Submit>((event, emit) async {
      late Either<AuthFailure, Login> failureOption;
      final emailValid = state.form.email.isValid();
      final passwordValid = state.form.password.isValid();

      if (emailValid && passwordValid) {
        emit(state.copyWith(isSubmitting: true, loginFailureOption: none()));
        failureOption = await _repository.login(
          LoginForm(email: state.form.email, password: state.form.password),
        );
      }
      emit(state.copyWith(
          isSubmitting: false, loginFailureOption: some(failureOption)));
    });
  }
}
