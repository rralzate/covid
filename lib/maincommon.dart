import 'package:covid/core/routes/page_generator.dart';
import 'package:covid/core/theme/app_theme.dart';
import 'package:covid/core/theme/theme_provider.dart';
import 'package:covid/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Covid-19",
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        darkTheme: appThemeLight,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: PageClassGenerator.getNamedScreen,
      );
    });
  }
}
