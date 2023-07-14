import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormEmailValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FormEmailValue(String input) {
    assert(input != null);
    return FormEmailValue._(
        validateEmailAddress(input).flatMap(validateStringNotEmpty));
  }

  const FormEmailValue._(this.value);
}
