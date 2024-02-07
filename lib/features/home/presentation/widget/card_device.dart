import 'dart:io';

import 'package:covid/core/theme/fonts.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? _androidInfo;
  IosDeviceInfo? _iosInfo;

  @override
  void initState() {
    super.initState();
    _deviceInfo = DeviceInfoPlugin();
    _initDeviceInfo();
  }

  void _initDeviceInfo() async {
    if (Platform.isAndroid) {
      _androidInfo = await _deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      _iosInfo = await _deviceInfo.iosInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getContainerInfo();
  }

  Widget _getContainerInfo() {
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(top: 30.h),
      width: 80.w,
      height: 18.h,
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
                  _androidInfo != null
                      ? _androidInfo!.device
                      : (_iosInfo == null ? '' : _iosInfo!.name),
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
                  _androidInfo != null
                      ? _androidInfo!.brand
                      : (_iosInfo == null ? '' : _iosInfo!.utsname.machine),
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  _androidInfo != null
                      ? _androidInfo!.type
                      : (_iosInfo == null ? '' : _getDeviceTypeText(_iosInfo!)),
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
                  _androidInfo != null
                      ? _androidInfo!.model
                      : (_iosInfo == null ? '' : _iosInfo!.model),
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                child: Text(
                  _androidInfo != null
                      ? _androidInfo!.version.release
                      : (_iosInfo == null
                          ? ''
                          : "${_iosInfo!.systemName} ${_iosInfo!.systemVersion}"),
                  style: textBlackStyle(Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getDeviceTypeText(IosDeviceInfo iosInfo) {
    if (iosInfo.model.contains('iPhone')) {
      return 'Phone';
    } else if (iosInfo.model.contains('iPad')) {
      return 'Ipad';
    } else {
      return 'Unknown';
    }
  }

  int getCurrentHour() {
    DateTime now = DateTime.now();
    return now.hour;
  }
}
