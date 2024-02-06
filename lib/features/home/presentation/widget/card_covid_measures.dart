import 'package:covid/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardCovidMeaures extends StatelessWidget {
  const CardCovidMeaures({
    super.key,
    required this.measure,
    required this.title,
    this.visible = true,
  });

  final String measure;
  final String title;
  final bool? visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: Container(
        padding: EdgeInsets.all(2.h),
        width: 38.w,
        height: 8.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                measure,
                style: textBlackStyleSubTitleBold,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: textBlackStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
