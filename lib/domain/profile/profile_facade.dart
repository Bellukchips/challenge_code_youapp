import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';
import 'package:youapp_test/domain/profile/models/profile_form.dart';

abstract class ProfileFacade {
  Future<Either<AuthFailure, Profile>> getProfile();
  Future<Either<AuthFailure, Profile>> createProfile(ProfileForm form);
  Future<Either<AuthFailure, Profile>> updateProfile(ProfileForm form);
  Future<Either<AuthFailure, Profile>> updateInterest(List<String> interests);
}
