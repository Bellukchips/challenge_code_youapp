import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/login/login_facade.dart';
import 'package:youapp_test/domain/login/models/login.dart';
import 'package:youapp_test/domain/login/models/login_form.dart';
import 'package:youapp_test/infrastructure/login/models/login_dto.dart';

@LazySingleton(as: LoginFacade)
class LoginRepository implements LoginFacade {
  final Dio _network;

  LoginRepository(this._network);
  @override
  Future<Either<AuthFailure, Login>> login(LoginForm form) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final email = form.email.getOrCrash();
      final password = form.password.getOrCrash();

      _network.options.contentType = Headers.formUrlEncodedContentType;
      final response = await _network.post('/login',
          data: {
            'email': email,
            'username': email,
            'password': password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      var result = response.data;
      if (result['message'] == 'User not found' ||
          result['message'] == 'Incorrect password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }
      return right(LoginDto.fromJson(result).toDomain());
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(AuthFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(AuthFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }
}
