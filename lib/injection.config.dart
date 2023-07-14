// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alice/alice.dart' as _i9;
import 'package:dio/dio.dart' as _i10;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'application/register/register_bloc.dart' as _i13;
import 'domain/register/register_facade.dart' as _i11;
import 'infrastructure/core/register_module.dart' as _i14;
import 'infrastructure/register/register_repository.dart' as _i12;
import 'presentation/core/app.dart' as _i3;
import 'presentation/router/app_route.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i3.App>(() => _i3.App(key: gh<_i4.Key>()));
    gh.lazySingleton<_i5.AppRouter>(() => registerModules.appRouter);
    gh.lazySingleton<_i6.Client>(() => registerModules.httpClient);
    gh.lazySingleton<_i7.Logger>(() => registerModules.logger);
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModules.sharedPreferences,
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i9.Alice>(
        () => registerModules.alice(gh<_i5.AppRouter>()));
    await gh.lazySingletonAsync<_i10.Dio>(
      () => registerModules.network(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i8.SharedPreferences>(),
        gh<_i9.Alice>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i11.RegisterFacade>(
        () => _i12.RegisterRepository(gh<_i10.Dio>()));
    gh.factory<_i13.RegisterBloc>(
        () => _i13.RegisterBloc(gh<_i11.RegisterFacade>()));
    return this;
  }
}

class _$RegisterModules extends _i14.RegisterModules {}
