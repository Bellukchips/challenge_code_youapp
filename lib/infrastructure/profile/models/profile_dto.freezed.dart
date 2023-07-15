// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) {
  return _ProfileDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileDto {
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get horoscope => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  List<String>? get interest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDtoCopyWith<ProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDtoCopyWith<$Res> {
  factory $ProfileDtoCopyWith(
          ProfileDto value, $Res Function(ProfileDto) then) =
      _$ProfileDtoCopyWithImpl<$Res, ProfileDto>;
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
class _$ProfileDtoCopyWithImpl<$Res, $Val extends ProfileDto>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ProfileDtoCopyWith<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  factory _$$_ProfileDtoCopyWith(
          _$_ProfileDto value, $Res Function(_$_ProfileDto) then) =
      __$$_ProfileDtoCopyWithImpl<$Res>;
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
class __$$_ProfileDtoCopyWithImpl<$Res>
    extends _$ProfileDtoCopyWithImpl<$Res, _$_ProfileDto>
    implements _$$_ProfileDtoCopyWith<$Res> {
  __$$_ProfileDtoCopyWithImpl(
      _$_ProfileDto _value, $Res Function(_$_ProfileDto) _then)
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
    return _then(_$_ProfileDto(
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
@JsonSerializable()
class _$_ProfileDto extends _ProfileDto {
  const _$_ProfileDto(
      {this.email,
      this.username,
      this.name,
      this.birthday,
      this.horoscope,
      this.height,
      this.weight,
      final List<String>? interest})
      : _interest = interest,
        super._();

  factory _$_ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDtoFromJson(json);

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
    return 'ProfileDto(email: $email, username: $username, name: $name, birthday: $birthday, horoscope: $horoscope, height: $height, weight: $weight, interest: $interest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileDto &&
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

  @JsonKey(ignore: true)
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
  _$$_ProfileDtoCopyWith<_$_ProfileDto> get copyWith =>
      __$$_ProfileDtoCopyWithImpl<_$_ProfileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDtoToJson(
      this,
    );
  }
}

abstract class _ProfileDto extends ProfileDto {
  const factory _ProfileDto(
      {final String? email,
      final String? username,
      final String? name,
      final String? birthday,
      final String? horoscope,
      final int? height,
      final int? weight,
      final List<String>? interest}) = _$_ProfileDto;
  const _ProfileDto._() : super._();

  factory _ProfileDto.fromJson(Map<String, dynamic> json) =
      _$_ProfileDto.fromJson;

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
  _$$_ProfileDtoCopyWith<_$_ProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}
