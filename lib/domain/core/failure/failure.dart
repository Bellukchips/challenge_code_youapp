import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({required T failedValue}) =
      ShortPassword<T>;
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;

  const factory ValueFailure.multiline({required T failedValue}) = Multiline<T>;
  const factory ValueFailure.singleLine({required T failedValue}) =
      SingleLine<T>;
  const factory ValueFailure.exceedingLength(
      {required T failedValue, required int max}) = ExceedingLength<T>;
  const factory ValueFailure.invalidDate({required T failedValue}) =
      InvalidDate<T>;
  const factory ValueFailure.invalidNumber({required T failedValue}) =
      InvalidNumber<T>;
}
