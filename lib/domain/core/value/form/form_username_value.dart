import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormUsernameValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 50;

  factory FormUsernameValue(String input) {
    assert(input != null);
    return FormUsernameValue._(validateStringNotEmpty(input));
  }

  const FormUsernameValue._(this.value);
}
