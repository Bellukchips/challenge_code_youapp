import 'package:freezed_annotation/freezed_annotation.dart';
part 'login.freezed.dart';

@freezed
abstract class Login with _$Login {
  const Login._();
  const factory Login(
      {required String? message, required String? accessToken}) = _Login;
  factory Login.empty() => const Login(message: '', accessToken: '');
}
