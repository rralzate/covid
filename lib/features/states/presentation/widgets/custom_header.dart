import 'package:covid/core/routes/resource_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/colors.dart';

class CustomHeader extends StatelessWidget {
  final String imageHeader;
  final VoidCallback back;
  final VoidCallback? share;

  const CustomHeader({
    super.key,
    required this.imageHeader,
    required this.back,
    this.share,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              imageHeader,
              fit: BoxFit.fill,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Container(
                    color: mainWhite,
                    child: Image.asset(logo, fit: BoxFit.fill),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  height: 30.h,
                  logo,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h, right: 4.w, left: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(color: colorWhite, onPressed: back),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
