import 'package:covid/features/home/presentation/widget/card_device.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({super.key});

  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content of the screen
        const Center(
          child: CardDevice(),
        ),

        //Dark/Light theme button container
        Positioned(
          bottom: 1.0,
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
                  print("InkWell");
                  // Toggle between dark and light themes
                  // Provider.of<ThemeProvider>(context, listen: false)
                  //     .toggleTheme();
                },
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: const Icon(
                    Icons.brightness_6,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
