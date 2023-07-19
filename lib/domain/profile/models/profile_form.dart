import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/domain/core/value/form/form_birthday_value.dart';
import 'package:youapp_test/domain/core/value/form/form_integer_value.dart';
import 'package:youapp_test/domain/core/value/form/form_single_line.dart';
part 'profile_form.freezed.dart';

@freezed
abstract class ProfileForm with _$ProfileForm {
  const ProfileForm._();
  const factory ProfileForm({
    required FormSingleLineValue? name,
    required FormBirthdayValue? birthday,
    required FormIntegerValue? height,
    required FormIntegerValue? weight,
  }) = _ProfileForm;

  factory ProfileForm.empty() => ProfileForm(
        name: FormSingleLineValue(''),
        birthday: FormBirthdayValue(''),
        height: FormIntegerValue(0),
        weight: FormIntegerValue(0),
      );
}
