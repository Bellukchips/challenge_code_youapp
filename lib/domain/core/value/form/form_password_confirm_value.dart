import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormPasswordConfirmValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FormPasswordConfirmValue(String input) {
    assert(input != null);
    return FormPasswordConfirmValue._(
        validatePassword(input).flatMap(validateStringNotEmpty));
  }

  const FormPasswordConfirmValue._(this.value);
}
