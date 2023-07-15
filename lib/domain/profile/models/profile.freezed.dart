// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Profile {
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get horoscope => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  List<String>? get interest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? email,
      String? username,
      String? name,
      String? birthday,
      String? horoscope,
      int? height,
      int? weight,
      List<String>? interest});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? birthday = freezed,
    Object? horoscope = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? interest = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      horoscope: freezed == horoscope
          ? _value.horoscope
          : horoscope // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      interest: freezed == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? username,
      String? name,
      String? birthday,
      String? horoscope,
      int? height,
      int? weight,
      List<String>? interest});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? birthday = freezed,
    Object? horoscope = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? interest = freezed,
  }) {
    return _then(_$_Profile(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      horoscope: freezed == horoscope
          ? _value.horoscope
          : horoscope // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      interest: freezed == interest
          ? _value._interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_Profile extends _Profile {
  const _$_Profile(
      {required this.email,
      required this.username,
      required this.name,
      required this.birthday,
      required this.horoscope,
      required this.height,
      required this.weight,
      required final List<String>? interest})
      : _interest = interest,
        super._();

  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? birthday;
  @override
  final String? horoscope;
  @override
  final int? height;
  @override
  final int? weight;
  final List<String>? _interest;
  @override
  List<String>? get interest {
    final value = _interest;
    if (value == null) return null;
    if (_interest is EqualUnmodifiableListView) return _interest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Profile(email: $email, username: $username, name: $name, birthday: $birthday, horoscope: $horoscope, height: $height, weight: $weight, interest: $interest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.horoscope, horoscope) ||
                other.horoscope == horoscope) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._interest, _interest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      username,
      name,
      birthday,
      horoscope,
      height,
      weight,
      const DeepCollectionEquality().hash(_interest));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);
}

abstract class _Profile extends Profile {
  const factory _Profile(
      {required final String? email,
      required final String? username,
      required final String? name,
      required final String? birthday,
      required final String? horoscope,
      required final int? height,
      required final int? weight,
      required final List<String>? interest}) = _$_Profile;
  const _Profile._() : super._();

  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get name;
  @override
  String? get birthday;
  @override
  String? get horoscope;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  List<String>? get interest;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
