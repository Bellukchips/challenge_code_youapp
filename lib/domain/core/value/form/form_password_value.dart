import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormPasswordValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FormPasswordValue(String input) {
    assert(input != null);
    return FormPasswordValue._(
        validatePassword(input).flatMap(validateStringNotEmpty));
  }

  const FormPasswordValue._(this.value);
}
