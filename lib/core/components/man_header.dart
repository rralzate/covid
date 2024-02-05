import 'package:covid/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            margin: EdgeInsets.only(top: 2.h, right: 4.w, left: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
