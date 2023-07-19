import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';
import 'package:youapp_test/domain/core/value/value_object.dart';
import 'package:youapp_test/domain/core/value/value_validators.dart';

class FormIntegerValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory FormIntegerValue(int input) {
    assert(input != null);
    return FormIntegerValue._(validateNumber(input));
  }

  const FormIntegerValue._(this.value);
}
