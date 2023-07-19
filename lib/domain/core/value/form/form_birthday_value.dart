import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormBirthdayValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FormBirthdayValue(String input) {
    assert(input != null);
    return FormBirthdayValue._(validateBirthday(input).flatMap(validateStringNotEmpty));
  }

  const FormBirthdayValue._(this.value);
}
