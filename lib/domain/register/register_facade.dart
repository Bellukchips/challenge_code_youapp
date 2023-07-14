import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/register/failure/register_failure.dart';
import 'package:youapp_test/domain/register/models/register_form.dart';

abstract class RegisterFacade {
  Future<Either<RegisterFailure, String>> register(RegisterForm form);
}
