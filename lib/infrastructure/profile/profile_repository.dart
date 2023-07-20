import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/domain/auth/failure/auth_failure.dart';
import 'package:youapp_test/domain/profile/models/profile.dart';
import 'package:youapp_test/domain/profile/models/profile_form.dart';
import 'package:youapp_test/domain/profile/profile_facade.dart';
import 'package:youapp_test/infrastructure/profile/models/profile_dto.dart';
import 'dart:convert';

@LazySingleton(as: ProfileFacade)
class ProfileRepository implements ProfileFacade {
  final Dio _network;

  ProfileRepository(this._network);
  @override
  Future<Either<AuthFailure, Profile>> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      var response = await _network.get('/getProfile');
      var result = response.data['data'];
      return right(ProfileDto.fromJson(result).toDomain());
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(AuthFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(AuthFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }

  @override
  Future<Either<AuthFailure, Profile>> createProfile(ProfileForm form) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      final name = form.name?.getOrCrash() ?? '';
      final birthday = form.birthday?.getOrCrash().replaceAll(' ', '') ?? '';
      final height = form.height?.getOrCrash();
      final weight = form.weight?.getOrCrash();
      var map = {
        'name': name,
        'birthday': birthday,
        'height': height,
        'weight': weight,
        'interests': []
      };
      var data = FormData.fromMap(map);
      debugPrint('DATA $data');

      Response response = await _network.post(
        '/createProfile',
        data: jsonEncode(map),
      );

      var result = response.data['data'];
      return right(ProfileDto.fromJson(result).toDomain());
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(AuthFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(AuthFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }

  @override
  Future<Either<AuthFailure, Profile>> updateProfile(ProfileForm form) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      final name = form.name?.getOrCrash() ?? '';
      final birthday = form.birthday?.getOrCrash().replaceAll(' ', '') ?? '';
      final height = form.height?.getOrCrash();
      final weight = form.weight?.getOrCrash();
      var map = {
        'name': name,
        'birthday': birthday,
        'height': height,
        'weight': weight,
      };
      var data = FormData.fromMap(map);
      debugPrint('DATA $data');

      Response response = await _network.put(
        '/updateProfile',
        data: jsonEncode(map),
      );
      var result = response.data['data'];
      return right(ProfileDto.fromJson(result).toDomain());
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(AuthFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(AuthFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }

  @override
  Future<Either<AuthFailure, Profile>> updateInterest(
      List<String> interests) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      Response response =
          await _network.put('/updateProfile', data: {'interests': interests});
      var result = response.data['data'];
      return right(ProfileDto.fromJson(result).toDomain());
    } on DioException catch (e) {
      if (e.response != null) {
        var message = e.response?.statusMessage.toString();
        return left(AuthFailure.unexpected(message ?? ""));
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return left(AuthFailure.unexpected('${e.message} ${e.error}'));
      }
    }
  }
}
