import 'package:covid/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/resource_icons.dart';

class ManHeader extends StatelessWidget {
  const ManHeader({
    super.key,
    required this.imageHeader,
    this.back,
  });

  final String imageHeader;
  final VoidCallback? back;

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
            margin: EdgeInsets.only(right: 5.w, left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  logo,
                  width: 20.w,
                  height: 20.h,
                ),
                back != null
                    ? InkWell(
                        onTap: back,
                        child: const CircleAvatar(
                          backgroundColor: colorWhite,
                          child: Icon(Icons.logout_rounded),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          )
        ],
      ),
    );
  }
}
