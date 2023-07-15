import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const Profile._();
  const factory Profile(
      {required String? email,
      required String? username,
      required String? name,
      required String? birthday,
      required String? horoscope,
      required int? height,
      required int? weight,
      required List<String>? interest}) = _Profile;

  factory Profile.empty() => const Profile(
      email: '',
      username: '',
      name: '',
      birthday: '',
      horoscope: '',
      height: 0,
      weight: 0,
      interest: []);
}
