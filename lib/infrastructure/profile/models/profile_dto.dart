import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';
part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const ProfileDto._();
  const factory ProfileDto(
      {String? email,
      String? username,
      String? name,
      String? birthday,
      String? horoscope,
      int? height,
      int? weight,
      List<String>? interests}) = _ProfileDto;
  Profile toDomain() {
    return Profile(
        email: email,
        username: username,
        name: name,
        birthday: birthday,
        horoscope: horoscope,
        height: height,
        weight: weight,
        interests: interests);
  }

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
  factory ProfileDto.fromDomain(Profile profile) {
    return ProfileDto(
        birthday: profile.birthday,
        email: profile.email,
        height: profile.height,
        horoscope: profile.horoscope,
        interests: profile.interests,
        name: profile.name,
        username: profile.username,
        weight: profile.weight);
  }
}
