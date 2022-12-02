import 'package:flutter/material.dart';
import 'package:sputnik_test_flutter/ui/auth/sign_in_view.dart';
import 'package:sputnik_test_flutter/ui/onboarding/onboarding_view.dart';

abstract class RouteNames {
  static const String onboarding = 'onboarding';
  static const String signIn = 'signIn';
}

class AppRouter {
  String initialRoute() => RouteNames.onboarding;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (context) => const SignInView());
      default:
        throw ('This route name does not exists');
    }
  }
}
