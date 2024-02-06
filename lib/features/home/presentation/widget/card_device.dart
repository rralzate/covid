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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(top: 30.h),
      width: 80.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "Nombre del dispositivo",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "XXXXXXX",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "Tipo del dispositivo",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "AAAAAAAAAA",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "Sistema operativo y su versión",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  "A.B.C.D",
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
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
