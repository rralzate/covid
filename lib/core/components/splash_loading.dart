import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/resource_icons.dart';
import '../theme/colors.dart';

class SplashLoadingPage extends StatelessWidget {
  const SplashLoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: double.infinity,
      color: colorWhite.withOpacity(0.2),
      child: SizedBox(
        child: SizedBox(
          child: Image(
            image: const AssetImage(loadingGIF),
            fit: BoxFit.cover,
            height: 5.h,
          ),
        ),
      ),
    );
  }
}
