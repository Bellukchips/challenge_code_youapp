import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected([String? error]) = _Unexpected;
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.unauthenticated() = _Unauthenticated;
  const factory AuthFailure.tokenNotProvided() = _TokenNotProvided;
  const factory AuthFailure.badRequest() = _BadRequest;
}
