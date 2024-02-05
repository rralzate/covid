import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/fonts.dart';

class WomenHeader extends StatelessWidget {
  const WomenHeader({
    super.key,
    required this.imageHeader,
  });

  final String imageHeader;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              imageHeader,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 33.h, right: 4.w, left: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenido a:",
                  style: textBlackStyle,
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Evertec",
                  style: textBlackStyleBold,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
