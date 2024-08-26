import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/app_router.dart';
import 'package:e_clot/presentation/auth/pages/signin_page.dart';
import 'package:e_clot/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.splashPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const SplashPage(),
      );
    case AppRouter.signinPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const SigninPage(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const PageNotFoundScreen(),
      );
  }
}
