// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileForm {
  FormSingleLineValue? get name => throw _privateConstructorUsedError;
  FormBirthdayValue? get birthday => throw _privateConstructorUsedError;
  FormIntegerValue? get height => throw _privateConstructorUsedError;
  FormIntegerValue? get weight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileFormCopyWith<ProfileForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileFormCopyWith<$Res> {
  factory $ProfileFormCopyWith(
          ProfileForm value, $Res Function(ProfileForm) then) =
      _$ProfileFormCopyWithImpl<$Res, ProfileForm>;
  @useResult
  $Res call(
      {FormSingleLineValue? name,
      FormBirthdayValue? birthday,
      FormIntegerValue? height,
      FormIntegerValue? weight});
}

/// @nodoc
class _$ProfileFormCopyWithImpl<$Res, $Val extends ProfileForm>
    implements $ProfileFormCopyWith<$Res> {
  _$ProfileFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthday = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormSingleLineValue?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as FormBirthdayValue?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as FormIntegerValue?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as FormIntegerValue?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileFormCopyWith<$Res>
    implements $ProfileFormCopyWith<$Res> {
  factory _$$_ProfileFormCopyWith(
          _$_ProfileForm value, $Res Function(_$_ProfileForm) then) =
      __$$_ProfileFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormSingleLineValue? name,
      FormBirthdayValue? birthday,
      FormIntegerValue? height,
      FormIntegerValue? weight});
}

/// @nodoc
class __$$_ProfileFormCopyWithImpl<$Res>
    extends _$ProfileFormCopyWithImpl<$Res, _$_ProfileForm>
    implements _$$_ProfileFormCopyWith<$Res> {
  __$$_ProfileFormCopyWithImpl(
      _$_ProfileForm _value, $Res Function(_$_ProfileForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthday = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$_ProfileForm(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FormSingleLineValue?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as FormBirthdayValue?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as FormIntegerValue?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as FormIntegerValue?,
    ));
  }
}

/// @nodoc

class _$_ProfileForm extends _ProfileForm {
  const _$_ProfileForm(
      {required this.name,
      required this.birthday,
      required this.height,
      required this.weight})
      : super._();

  @override
  final FormSingleLineValue? name;
  @override
  final FormBirthdayValue? birthday;
  @override
  final FormIntegerValue? height;
  @override
  final FormIntegerValue? weight;

  @override
  String toString() {
    return 'ProfileForm(name: $name, birthday: $birthday, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileForm &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, birthday, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileFormCopyWith<_$_ProfileForm> get copyWith =>
      __$$_ProfileFormCopyWithImpl<_$_ProfileForm>(this, _$identity);
}

abstract class _ProfileForm extends ProfileForm {
  const factory _ProfileForm(
      {required final FormSingleLineValue? name,
      required final FormBirthdayValue? birthday,
      required final FormIntegerValue? height,
      required final FormIntegerValue? weight}) = _$_ProfileForm;
  const _ProfileForm._() : super._();

  @override
  FormSingleLineValue? get name;
  @override
  FormBirthdayValue? get birthday;
  @override
  FormIntegerValue? get height;
  @override
  FormIntegerValue? get weight;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileFormCopyWith<_$_ProfileForm> get copyWith =>
      throw _privateConstructorUsedError;
}
