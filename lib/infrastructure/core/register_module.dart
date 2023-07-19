import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/config.dart';

@module
abstract class RegisterModules {
  @Named('baseUrl')
  String get baseUrl => Config.server;

  @lazySingleton
  Logger get logger => Logger(
        filter: null,
        printer: PrettyPrinter(
          stackTraceBeginIndex: 1,
          methodCount: 2,
          printTime: true,
        ),
        output: null, //
      );

  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @lazySingleton
  Alice alice(AppRouter appRouter) =>
      Alice(navigatorKey: appRouter.navigatorKey, showNotification: false);

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  http.Client get httpClient => http.Client();

  @preResolve
  @lazySingleton
  Future<Dio> network(@Named('baseUrl') String baseUrl,
      SharedPreferences sharedPreferences, Alice alice) async {
    var options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
        baseUrl: baseUrl,
        sendTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 20000));

    final _client = Dio(options);
    _client.interceptors.addAll([
      RequestInterceptor(sharedPreferences),
      ResponseInterceptor(),
      InterceptorsWrapper(),
      alice.getDioInterceptor()
    ]);

    return _client;
  }
}

class ResponseInterceptor extends Interceptor {
  ResponseInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Automatically logout or refresh token
      debugPrint('TOKEN REVOKED');
    }
    super.onError(err, handler);
  }
}

class RequestInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;

  RequestInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = _sharedPreferences.getString(Config.token);
    debugPrint('TOKEN $token');
    if (token != null) {
      //handle token
      options.headers = {
        'x-access-token': token,
      };
    }
    super.onRequest(options, handler);
  }
}
