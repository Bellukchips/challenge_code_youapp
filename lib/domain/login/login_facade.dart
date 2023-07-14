import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/login/models/login.dart';
import 'package:youapp_test/domain/login/models/login_form.dart';

abstract class LoginFacade {
  Future<Either<AuthFailure, Login>> login(LoginForm form);
}
