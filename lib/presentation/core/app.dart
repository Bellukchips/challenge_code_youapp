import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/application/authentication/authentication_bloc.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/router/app_route.dart';

@Injectable()
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    //
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          authenticated: () => router.replace(const AboutRoute()),
          unauthenticated: () => router.replace(const LoginRoute()),
        );
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'You MyApp',
        routerDelegate: AutoRouterDelegate(router),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
