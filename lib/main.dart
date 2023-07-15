import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/authentication/authentication_bloc.dart';
import 'package:youapp_test/application/login/login_bloc.dart';
import 'package:youapp_test/application/observer/bloc_observer.dart';
import 'package:youapp_test/application/profile/profile_bloc.dart';
import 'package:youapp_test/application/register/register_bloc.dart';
import 'package:youapp_test/injection.dart';

import 'presentation/core/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthenticationBloc>()
            ..add(const AuthenticationEvent.authCheck()),
        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        )
      ],
      child: MyApp(),
    ),
  );
}
