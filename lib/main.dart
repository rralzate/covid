import 'package:flutter/material.dart';
import 'package:covid/injection_container.dart';

import 'package:intl/date_symbol_data_local.dart'; // Import this package
import 'package:provider/provider.dart';

import 'core/theme/theme_provider.dart';
import 'maincommon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await injectDependencies();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}
