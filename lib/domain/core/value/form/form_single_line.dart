import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormSingleLineValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FormSingleLineValue(String input) {
    assert(input != null);
    return FormSingleLineValue._(
        validateStringNotEmpty(input).flatMap(validateSingleLine));
  }

  const FormSingleLineValue._(this.value);
}
