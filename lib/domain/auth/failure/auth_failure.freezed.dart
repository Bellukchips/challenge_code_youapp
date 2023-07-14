// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Unexpected(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthFailure.unexpected(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unexpected &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      __$$_UnexpectedCopyWithImpl<_$_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) {
    return unexpected(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) {
    return unexpected?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements AuthFailure {
  const factory _Unexpected([final String? error]) = _$_Unexpected;

  String? get error;
  @JsonKey(ignore: true)
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerErrorCopyWith<$Res> {
  factory _$$_ServerErrorCopyWith(
          _$_ServerError value, $Res Function(_$_ServerError) then) =
      __$$_ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_ServerError>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthFailure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_Unauthenticated>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AuthFailure.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthFailure {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$$_TokenNotProvidedCopyWith<$Res> {
  factory _$$_TokenNotProvidedCopyWith(
          _$_TokenNotProvided value, $Res Function(_$_TokenNotProvided) then) =
      __$$_TokenNotProvidedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TokenNotProvidedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_TokenNotProvided>
    implements _$$_TokenNotProvidedCopyWith<$Res> {
  __$$_TokenNotProvidedCopyWithImpl(
      _$_TokenNotProvided _value, $Res Function(_$_TokenNotProvided) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TokenNotProvided implements _TokenNotProvided {
  const _$_TokenNotProvided();

  @override
  String toString() {
    return 'AuthFailure.tokenNotProvided()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TokenNotProvided);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) {
    return tokenNotProvided();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) {
    return tokenNotProvided?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (tokenNotProvided != null) {
      return tokenNotProvided();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) {
    return tokenNotProvided(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) {
    return tokenNotProvided?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) {
    if (tokenNotProvided != null) {
      return tokenNotProvided(this);
    }
    return orElse();
  }
}

abstract class _TokenNotProvided implements AuthFailure {
  const factory _TokenNotProvided() = _$_TokenNotProvided;
}

/// @nodoc
abstract class _$$_BadRequestCopyWith<$Res> {
  factory _$$_BadRequestCopyWith(
          _$_BadRequest value, $Res Function(_$_BadRequest) then) =
      __$$_BadRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BadRequestCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_BadRequest>
    implements _$$_BadRequestCopyWith<$Res> {
  __$$_BadRequestCopyWithImpl(
      _$_BadRequest _value, $Res Function(_$_BadRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BadRequest implements _BadRequest {
  const _$_BadRequest();

  @override
  String toString() {
    return 'AuthFailure.badRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? error) unexpected,
    required TResult Function() serverError,
    required TResult Function() unauthenticated,
    required TResult Function() tokenNotProvided,
    required TResult Function() badRequest,
  }) {
    return badRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? error)? unexpected,
    TResult? Function()? serverError,
    TResult? Function()? unauthenticated,
    TResult? Function()? tokenNotProvided,
    TResult? Function()? badRequest,
  }) {
    return badRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? error)? unexpected,
    TResult Function()? serverError,
    TResult Function()? unauthenticated,
    TResult Function()? tokenNotProvided,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_TokenNotProvided value) tokenNotProvided,
    required TResult Function(_BadRequest value) badRequest,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_TokenNotProvided value)? tokenNotProvided,
    TResult? Function(_BadRequest value)? badRequest,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_TokenNotProvided value)? tokenNotProvided,
    TResult Function(_BadRequest value)? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequest implements AuthFailure {
  const factory _BadRequest() = _$_BadRequest;
}
