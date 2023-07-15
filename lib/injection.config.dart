// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alice/alice.dart' as _i9;
import 'package:dio/dio.dart' as _i13;
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'application/authentication/authentication_bloc.dart' as _i12;
import 'application/login/login_bloc.dart' as _i20;
import 'application/profile/profile_bloc.dart' as _i21;
import 'application/register/register_bloc.dart' as _i22;
import 'domain/auth/auth_facade.dart' as _i10;
import 'domain/login/login_facade.dart' as _i14;
import 'domain/profile/profile_facade.dart' as _i16;
import 'domain/register/register_facade.dart' as _i18;
import 'infrastructure/auth/auth_repository.dart' as _i11;
import 'infrastructure/core/register_module.dart' as _i23;
import 'infrastructure/login/login_repository.dart' as _i15;
import 'infrastructure/profile/profile_repository.dart' as _i17;
import 'infrastructure/register/register_repository.dart' as _i19;
import 'presentation/core/app.dart' as _i6;
import 'presentation/router/app_route.dart' as _i3;

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
    gh.lazySingleton<_i3.AppRouter>(() => registerModules.appRouter);
    gh.lazySingleton<_i4.Client>(() => registerModules.httpClient);
    gh.lazySingleton<_i5.Logger>(() => registerModules.logger);
    gh.factory<_i6.MyApp>(() => _i6.MyApp(key: gh<_i7.Key>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModules.sharedPreferences,
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i9.Alice>(
        () => registerModules.alice(gh<_i3.AppRouter>()));
    gh.lazySingleton<_i10.AuthFacade>(
        () => _i11.AuthRepository(gh<_i8.SharedPreferences>()));
    gh.factory<_i12.AuthenticationBloc>(
        () => _i12.AuthenticationBloc(gh<_i10.AuthFacade>()));
    await gh.lazySingletonAsync<_i13.Dio>(
      () => registerModules.network(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i8.SharedPreferences>(),
        gh<_i9.Alice>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i14.LoginFacade>(
        () => _i15.LoginRepository(gh<_i13.Dio>()));
    gh.lazySingleton<_i16.ProfileFacade>(
        () => _i17.ProfileRepository(gh<_i13.Dio>()));
    gh.lazySingleton<_i18.RegisterFacade>(
        () => _i19.RegisterRepository(gh<_i13.Dio>()));
    gh.factory<_i20.LoginBloc>(() => _i20.LoginBloc(gh<_i14.LoginFacade>()));
    gh.factory<_i21.ProfileBloc>(
        () => _i21.ProfileBloc(gh<_i16.ProfileFacade>()));
    gh.factory<_i22.RegisterBloc>(
        () => _i22.RegisterBloc(gh<_i18.RegisterFacade>()));
    return this;
  }
}

class _$RegisterModules extends _i23.RegisterModules {}
