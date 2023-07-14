// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterForm {
  FormEmailValue? get email => throw _privateConstructorUsedError;
  FormUsernameValue? get username => throw _privateConstructorUsedError;
  FormPasswordValue? get password => throw _privateConstructorUsedError;
  FormPasswordConfirmValue? get passwordConfirm =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormCopyWith<RegisterForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormCopyWith<$Res> {
  factory $RegisterFormCopyWith(
          RegisterForm value, $Res Function(RegisterForm) then) =
      _$RegisterFormCopyWithImpl<$Res, RegisterForm>;
  @useResult
  $Res call(
      {FormEmailValue? email,
      FormUsernameValue? username,
      FormPasswordValue? password,
      FormPasswordConfirmValue? passwordConfirm});
}

/// @nodoc
class _$RegisterFormCopyWithImpl<$Res, $Val extends RegisterForm>
    implements $RegisterFormCopyWith<$Res> {
  _$RegisterFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? passwordConfirm = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormEmailValue?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormUsernameValue?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormPasswordValue?,
      passwordConfirm: freezed == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as FormPasswordConfirmValue?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterFormCopyWith<$Res>
    implements $RegisterFormCopyWith<$Res> {
  factory _$$_RegisterFormCopyWith(
          _$_RegisterForm value, $Res Function(_$_RegisterForm) then) =
      __$$_RegisterFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormEmailValue? email,
      FormUsernameValue? username,
      FormPasswordValue? password,
      FormPasswordConfirmValue? passwordConfirm});
}

/// @nodoc
class __$$_RegisterFormCopyWithImpl<$Res>
    extends _$RegisterFormCopyWithImpl<$Res, _$_RegisterForm>
    implements _$$_RegisterFormCopyWith<$Res> {
  __$$_RegisterFormCopyWithImpl(
      _$_RegisterForm _value, $Res Function(_$_RegisterForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? passwordConfirm = freezed,
  }) {
    return _then(_$_RegisterForm(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormEmailValue?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as FormUsernameValue?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormPasswordValue?,
      passwordConfirm: freezed == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as FormPasswordConfirmValue?,
    ));
  }
}

/// @nodoc

class _$_RegisterForm extends _RegisterForm {
  const _$_RegisterForm(
      {required this.email,
      required this.username,
      required this.password,
      required this.passwordConfirm})
      : super._();

  @override
  final FormEmailValue? email;
  @override
  final FormUsernameValue? username;
  @override
  final FormPasswordValue? password;
  @override
  final FormPasswordConfirmValue? passwordConfirm;

  @override
  String toString() {
    return 'RegisterForm(email: $email, username: $username, password: $password, passwordConfirm: $passwordConfirm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterForm &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, username, password, passwordConfirm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterFormCopyWith<_$_RegisterForm> get copyWith =>
      __$$_RegisterFormCopyWithImpl<_$_RegisterForm>(this, _$identity);
}

abstract class _RegisterForm extends RegisterForm {
  const factory _RegisterForm(
          {required final FormEmailValue? email,
          required final FormUsernameValue? username,
          required final FormPasswordValue? password,
          required final FormPasswordConfirmValue? passwordConfirm}) =
      _$_RegisterForm;
  const _RegisterForm._() : super._();

  @override
  FormEmailValue? get email;
  @override
  FormUsernameValue? get username;
  @override
  FormPasswordValue? get password;
  @override
  FormPasswordConfirmValue? get passwordConfirm;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterFormCopyWith<_$_RegisterForm> get copyWith =>
      throw _privateConstructorUsedError;
}
