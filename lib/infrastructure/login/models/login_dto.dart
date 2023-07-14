import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/domain/login/models/login.dart';
part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  const LoginDto._();
  const factory LoginDto({String? message, String? access_token}) = _LoginDto;
  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
  factory LoginDto.fromDomain(Login login) {
    return LoginDto(message: login.message, access_token: login.accessToken);
  }
  Login toDomain() {
    return Login(message: message, accessToken: access_token);
  }
}
