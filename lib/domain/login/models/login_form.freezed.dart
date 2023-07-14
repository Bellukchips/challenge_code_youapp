// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginForm {
  FormEmailValue get email => throw _privateConstructorUsedError;
  FormPasswordConfirmValue get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormCopyWith<LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<$Res, LoginForm>;
  @useResult
  $Res call({FormEmailValue email, FormPasswordConfirmValue password});
}

/// @nodoc
class _$LoginFormCopyWithImpl<$Res, $Val extends LoginForm>
    implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormEmailValue,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormPasswordConfirmValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$$_LoginFormCopyWith(
          _$_LoginForm value, $Res Function(_$_LoginForm) then) =
      __$$_LoginFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormEmailValue email, FormPasswordConfirmValue password});
}

/// @nodoc
class __$$_LoginFormCopyWithImpl<$Res>
    extends _$LoginFormCopyWithImpl<$Res, _$_LoginForm>
    implements _$$_LoginFormCopyWith<$Res> {
  __$$_LoginFormCopyWithImpl(
      _$_LoginForm _value, $Res Function(_$_LoginForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginForm(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as FormEmailValue,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormPasswordConfirmValue,
    ));
  }
}

/// @nodoc

class _$_LoginForm extends _LoginForm {
  const _$_LoginForm({required this.email, required this.password}) : super._();

  @override
  final FormEmailValue email;
  @override
  final FormPasswordConfirmValue password;

  @override
  String toString() {
    return 'LoginForm(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginForm &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      __$$_LoginFormCopyWithImpl<_$_LoginForm>(this, _$identity);
}

abstract class _LoginForm extends LoginForm {
  const factory _LoginForm(
      {required final FormEmailValue email,
      required final FormPasswordConfirmValue password}) = _$_LoginForm;
  const _LoginForm._() : super._();

  @override
  FormEmailValue get email;
  @override
  FormPasswordConfirmValue get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}
