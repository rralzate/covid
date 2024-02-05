import 'package:covid/core/routes/resource_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/splash_loading.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  ///Nombre de pantallla y ruta de navegacion
  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    processScreen();
    super.initState();
  }

  Future<void> processScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    goToLogin();
  }

  void goToLogin() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _mainScreen(),
      ),
    );
  }

  Widget _mainScreen() {
    return Stack(
      children: [
        _titleScreen(),
        const SplashLoadingPage(),
      ],
    );
  }

  Widget _titleScreen() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        logo,
      ),
    );
  }
}
