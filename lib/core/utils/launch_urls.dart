// ignore_for_file: only_throw_errors

import 'package:url_launcher/url_launcher.dart';

class LaunchLinks {
  static Future<void> launchLink({
    required Uri commingUrl,
  }) async {
    if (!await launchUrl(commingUrl)) {
      throw 'Could not launch $commingUrl';
    }
  }
}
