import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../components/custom_dialog_box.dart';

import '../routes/resource_icons.dart';

Future<void> showErrorDialog({
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return CustomDialogBox(
        icon: SvgPicture.asset(warningModalSVG),
        title: 'Lo sentimos',
        descriptions: message,
        confirmText: 'Aceptar',
        onAccept: () {
          Navigator.pop(ctx);
        },
      );
    },
  );
}
