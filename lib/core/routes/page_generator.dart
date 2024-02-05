import 'package:covid/features/auth/presentation/screens/login_screen.dart';
import 'package:covid/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:covid/features/auth/presentation/screens/splash_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PageClassGenerator {
  static Route<dynamic> getNamedScreen(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        builder = (context) => const SplashScreen();
        break;

      case LoginScreen.routeName:
        builder = (context) => const LoginScreen();
        break;

      case RegisterScreen.routeName:
        builder = (context) => const RegisterScreen();
        break;

      default:
        builder = (context) => const Material(
              child: Center(child: Text('Todavia no se ha aplicado')),
            );
    }

    return _commonPageWrapper(
      routeSettings: routeSettings,
      builder: builder,
    );
  }

  static Route<dynamic> _commonPageWrapper({
    required RouteSettings routeSettings,
    required Widget Function(BuildContext) builder,
  }) {
    return MaterialWithModalsPageRoute(
        settings: routeSettings,
        builder: (context) => Container(
              color: Colors.black.withOpacity(0.4),
              child: SafeArea(
                top: false,
                bottom: false,
                child: builder(context),
              ),
            ));
  }
}
