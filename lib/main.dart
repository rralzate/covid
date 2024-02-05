import 'package:flutter/material.dart';
import 'package:covid/injection_container.dart';

import 'maincommon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}
