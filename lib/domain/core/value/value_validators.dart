import 'package:dartz/dartz.dart';
import 'package:youapp_test/domain/core/failure/failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegex = r"""^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$""";
  if (RegExp(passwordRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
        ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.singleLine(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<int>, int> validateNumber(int input) {
  const numberRegex = r"""^[-+]?\d+(\.\d+)?$""";
  if (RegExp(numberRegex).hasMatch(input.toString())) {
    return right(input);
  } else {
    return left(ValueFailure.invalidNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateDate(String input) {
  const dateRegex = r"""^\d{4}-\d{2}-\d{2}$""";

  if (RegExp(dateRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidDate(failedValue: input));
  }
}
