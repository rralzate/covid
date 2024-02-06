import 'package:covid/core/routes/resource_icons.dart';
import 'package:covid/core/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/colors.dart';

class CardStates extends StatefulWidget {
  const CardStates({
    super.key,
    required this.name,
    required this.cases,
    required this.lastUpdate,
    required this.imageUrl,
    required this.onTap,
  });

  final String name;
  final String cases;
  final String lastUpdate;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  State<CardStates> createState() => _CardStatesState();
}

class _CardStatesState extends State<CardStates> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 2.h, right: 1.h),
      margin: EdgeInsets.only(top: 1.h, left: 5.w, right: 5.w),
      width: 90.w,
      height: 11.h,
      decoration: BoxDecoration(
        color: scaffold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              logo,
              fit: BoxFit.cover,
              width: 7.w,
              height: 4.h,
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Container(
                  color: mainWhite,
                  child: Image.asset(logo, fit: BoxFit.fill),
                ),
              );
            },
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: textBlackNameUserCardBold,
              ),
              Text(
                "Casos totales: ${widget.cases}",
                style: textBlackStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Ultima modificación: ${widget.lastUpdate}",
                style: textBlackStyle,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: widget.onTap,
            icon: const Icon(
              Icons.chevron_right_rounded,
              color: mainBlack,
            ),
          ),
        ],
      ),
    );
  }
}
