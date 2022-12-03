import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/ui/auth/sign_in_view.dart';
import 'package:sputnik_test_flutter/ui/auth/sign_in_view_model.dart';
import 'package:sputnik_test_flutter/ui/loader/loader_view.dart';
import 'package:sputnik_test_flutter/ui/main_view.dart';
import 'package:sputnik_test_flutter/ui/onboarding/onboarding_view.dart';

abstract class RouteNames {
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String main = '/signIn/main';
  static const String loader = '/';
}

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loader:
        return MaterialPageRoute(builder: (context) => LoaderView.create());
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RouteNames.signIn:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(create: (context) => SignInViewModel(context: context), child: const SignInView()));
      case RouteNames.main:
        return MaterialPageRoute(builder: (context) => MainView());
      default:
        throw ('This route name does not exists');
    }
  }
}
