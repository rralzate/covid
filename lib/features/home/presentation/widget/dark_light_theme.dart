import 'package:covid/core/theme/colors.dart';
import 'package:covid/core/theme/theme_provider.dart';
import 'package:covid/features/home/presentation/widget/card_device.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({super.key});

  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  ThemeMode _currentTheme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content of the screen
        const Center(
          child: CardDevice(),
        ),
        Positioned(
          bottom: 16.0, // Adjust the position as needed
          right: 16.0, // Adjust the position as needed
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle button press
              print('IconButton pressed!');
            },
            color: Colors.blue, // Set the icon color
            iconSize: 36.0, // Set the icon size
          ),
        ),

        // Dark/Light theme button container
        // Positioned(
        //   bottom: 16.0,
        //   right: 16.0,
        //   child: Theme(
        //     data: Theme.of(context).copyWith(
        //       splashColor: Colors.transparent,
        //       highlightColor: Colors.transparent,
        //     ),
        //     child: Material(
        //       color: secondColor,
        //       borderRadius: BorderRadius.circular(20.0),
        //       elevation: 4.0,
        //       child: GestureDetector(
        //         onTap: () {
        //           Provider.of<ThemeProvider>(context, listen: false)
        //               .toggleTheme();
        //         },
        //         child: InkWell(
        //           onTap: () {
        //             // Toggle between dark and light themes
        //             Provider.of<ThemeProvider>(context, listen: false)
        //                 .toggleTheme();
        //           },
        //           borderRadius: BorderRadius.circular(20.0),
        //           child: Container(
        //             padding: const EdgeInsets.all(12.0),
        //             child: const Icon(
        //               Icons.brightness_6,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
      //appTheme: _currentTheme,
    );
  }
}
