import 'package:covid/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utils/dates_format.dart';

class CardDevice extends StatefulWidget {
  const CardDevice({super.key});

  @override
  State<CardDevice> createState() => _CardDeviceState();
}

class _CardDeviceState extends State<CardDevice> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: _dataForm(),
      ),
      // Dark/Light theme button container
      _darkLightPositioned(context),
    ]);
  }

  Positioned _darkLightPositioned(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 16.0,
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
              print("InkWell was pressed");
              // setState(() {
              //   isDarkMode = !isDarkMode;
              // });
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                isDarkMode ? Icons.brightness_7 : Icons.brightness_4,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _dataForm() {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(top: 30.h),
      width: 80.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: darkGrey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  DatesFormat.formatDateSimpleText(DateTime.now()),
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "Nombre del dispositivo",
                  style: textBlackStyle,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "Fecha Actual",
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "XXXXXXX",
                  style: textBlackStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "Marca del dispositivo",
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "Tipo del dispositivo",
                  style: textBlackStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "XXXXXXXX",
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "AAAAAAAAAA",
                  style: textBlackStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "Modelo del dispositivo",
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "Sistema operativo y su versión",
                  style: textBlackStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  "XXXXXXXX",
                  style: textBlackStyle,
                ),
              ),
              Expanded(
                child: Text(
                  "A.B.C.D",
                  style: textBlackStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getCurrentHour() {
    DateTime now = DateTime.now();
    return now.hour;
  }
}
