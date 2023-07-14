import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_failure.freezed.dart';

@freezed
abstract class RegisterFailure with _$RegisterFailure {
  const factory RegisterFailure.unexpected([String? error]) = _Unexpected;
  const factory RegisterFailure.serverError() = _ServerError;
}
