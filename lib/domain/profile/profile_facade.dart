import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';

abstract class ProfileFacade {
  Future<Either<AuthFailure, Profile>> getProfile();
}
