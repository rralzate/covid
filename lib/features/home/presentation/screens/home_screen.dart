import 'package:covid/core/routes/resource_icons.dart';
import 'package:covid/core/theme/colors.dart';
import 'package:covid/features/auth/presentation/screens/login_screen.dart';

import 'package:covid/features/home/presentation/bloc/home_bloc.dart';
import 'package:covid/features/home/presentation/widget/dark_light_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/custom_dialog_box.dart';
import '../../../../core/components/man_header.dart';
import '../../../../injection_container.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _contentBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CircleAvatar(
        backgroundColor: secondColor,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            // Handle the button press
            print('FloatingActionButton pressed!');
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
        _principalBody(),
      ],
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

  Widget _principalBody() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        _loginForm(),
      ],
    );
  }

  Widget _loginForm() {
    return Container(
      margin: EdgeInsets.only(top: 42.h),
      padding: EdgeInsets.all(2.w),
      width: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
        ),
      ]),
    );
  }

  Future<void> _errorMessage(String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              icon: SvgPicture.asset(
                warningModalSVG,
                colorFilter:
                    const ColorFilter.mode(secondColor, BlendMode.srcIn),
              ),
              title: 'Lo sentimos',
              descriptions: message,
              confirmText: "Aceptar",
              onAccept: () {
                Navigator.pop(context);
              });
        });
  }

  Future<void> _message(String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              icon: SvgPicture.asset(
                warningModalSVG,
                colorFilter:
                    const ColorFilter.mode(secondColor, BlendMode.srcIn),
              ),
              title: 'Hola',
              descriptions: message,
              confirmText: "Aceptar",
              onAccept: () {
                Navigator.pop(context);
              });
        });
  }
}
