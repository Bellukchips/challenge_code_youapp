// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileDto _$$_ProfileDtoFromJson(Map<String, dynamic> json) =>
    _$_ProfileDto(
      email: json['email'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      horoscope: json['horoscope'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ProfileDtoToJson(_$_ProfileDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'birthday': instance.birthday,
      'horoscope': instance.horoscope,
      'height': instance.height,
      'weight': instance.weight,
      'interests': instance.interests,
    };
