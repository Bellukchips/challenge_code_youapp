import 'package:youapp_test/presentation/pages/login/login_page.dart';
import 'package:youapp_test/presentation/pages/splash/splash_page.dart';

import '../pages/register/register_page.dart';
import 'routes.dart';
import 'package:auto_route/auto_route.dart';
part 'app_route.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: Routes.splash, page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: Routes.login),
        AutoRoute(page: RegisterRoute.page, path: Routes.register)
      ];
}
