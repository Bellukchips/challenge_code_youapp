import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/router/app_route.dart';

@injectable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRoute = getIt<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'You App',
      routerDelegate: AutoRouterDelegate(_appRoute),
      routeInformationParser: _appRoute.defaultRouteParser(),
    );
  }
}
