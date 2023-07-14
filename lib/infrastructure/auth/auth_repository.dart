import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_test/domain/auth/auth_facade.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/login/models/login.dart';
import 'package:youapp_test/shared/config.dart';

@LazySingleton(as: AuthFacade)
class AuthRepository implements AuthFacade {
  final SharedPreferences _sharedPreferences;

  AuthRepository(this._sharedPreferences);
  @override
  Future<Either<AuthFailure, Unit>> authCheck() async {
    try {
      var token = _sharedPreferences.getString(Config.token);
      if (token != null) {
        return right(unit);
      }
      return left(const AuthFailure.badRequest());
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loggedIn(Login login) async {
    try {
      await _sharedPreferences.setString(Config.token, login.accessToken!);
      debugPrint('TOKEN ${login.accessToken}');
      return right(unit);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loggedOut() async {
    try {
      await _sharedPreferences.remove(Config.token);
      return right(unit);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }
}
