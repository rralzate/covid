import 'package:covid/core/routes/resource_icons.dart';
import 'package:covid/core/theme/colors.dart';
import 'package:covid/features/auth/presentation/screens/login_screen.dart';

import 'package:covid/features/home/presentation/bloc/home_bloc.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/man_header.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../injection_container.dart';
import '../../../states/presentation/screens/states_screen.dart';
import '../widget/card_covid_information.dart';
import '../widget/card_device.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = getIt<HomeBloc>();
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: _contentBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CircleAvatar(
        backgroundColor: secondColor,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            // Handle the button press
            Navigator.pushNamed(context, StatesScreen.routeName);
          },
          child: const CircleAvatar(
              backgroundColor: secondColor,
              child: Icon(
                Icons.add,
                color: colorWhite,
              )), // Add your icon or custom widget here
        ),
      ),
    );
  }

  Widget _contentBody() {
    return Stack(
      children: [
        _header(),
        const CardCovidInformation(),
        Positioned(
          right: 5.w,
          left: 5.w,
          child: const CardDevice(),
        ),
        _darkLightButton(),
      ],
    );
  }

  Positioned _darkLightButton() {
    return Positioned(
      bottom: 50.h,
      right: 6.w,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Material(
          color: secondColor,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 4.0,
          child: InkWell(
            onTap: () {
              // Toggle between dark and light themes
              setState(() {
                isDarkMode = !isDarkMode;
              });
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: isDarkMode
                  ? const Icon(
                      Icons.brightness_7,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.brightness_6,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return ManHeader(
      imageHeader: menImage,
      back: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
    );
  }
}
