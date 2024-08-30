import 'package:e_clot/common/common.dart';
import 'package:e_clot/core/routers/app_router.dart';
import 'package:e_clot/presentation/auth/pages/enter_password_page.dart';
import 'package:e_clot/presentation/auth/pages/forget_password_page.dart';
import 'package:e_clot/presentation/auth/pages/gender_and_age_selection_page.dart';
import 'package:e_clot/presentation/auth/pages/signin_page.dart';
import 'package:e_clot/presentation/auth/pages/signup_page.dart';
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
        builder: (BuildContext context) => SigninPage(),
      );
    case AppRouter.enterPasswordPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => EnterPasswordPage(),
      );
    case AppRouter.forgetPasswordPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const ForgetPasswordPage(),
      );
    case AppRouter.signupPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => SignupPage(),
      );
    case AppRouter.genderAndAgeSelectionPageRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const GenderAndAgeSelectionPage(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => const PageNotFoundScreen(),
      );
  }
}
