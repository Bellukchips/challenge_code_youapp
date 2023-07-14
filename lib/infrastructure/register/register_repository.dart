import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/register/failure/register_failure.dart';
import 'package:youapp_test/domain/register/models/register_form.dart';
import 'package:youapp_test/domain/register/register_facade.dart';

@LazySingleton(as: RegisterFacade)
class RegisterRepository implements RegisterFacade {
  final Dio _network;

  RegisterRepository(this._network);
  @override
  Future<Either<RegisterFailure, String>> register(RegisterForm form) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final email = form.email?.getOrCrash();
      final username = form.username?.getOrCrash();
      final password = form.password?.getOrCrash();

      //! api
      // Instance level
      _network.options.contentType = Headers.formUrlEncodedContentType;
      final response = await _network.post('/register',
          data: {"email": email, "username": username, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));

      var result = response.data['message'];
      return right(result);
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(RegisterFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(RegisterFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }
}
