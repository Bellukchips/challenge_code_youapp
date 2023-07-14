import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/login/models/login.dart';

abstract class AuthFacade {
  Future<Either<AuthFailure, Unit>> authCheck();
  Future<Either<AuthFailure, Unit>> loggedIn(Login login);
  Future<Either<AuthFailure, Unit>> loggedOut();
}
