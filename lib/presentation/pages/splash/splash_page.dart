import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/color_app.dart';
import 'package:youapp_test/shared/font_app.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      AutoRouter.of(context).replace(const LoginRoute());
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: ColorApp.dark),
        alignment: FractionalOffset.center,
        child: Text('You App',
            style: FontApp.primaryStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35)),
      ),
    );
  }
}
