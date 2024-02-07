import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/theme/colors.dart';

class HeaderInfoEvent extends StatefulWidget {
  final String keyName;
  final Color color;
  final String value;

  const HeaderInfoEvent({
    super.key,
    required this.color,
    required this.keyName,
    required this.value,
  });

  @override
  State<HeaderInfoEvent> createState() => _HeaderInfoEventState();
}

class _HeaderInfoEventState extends State<HeaderInfoEvent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      child: Column(
        children: [
          Text(
            widget.keyName,
            style: GoogleFonts.jost(
              fontSize: 14.sp,
              color: mainBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.2.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: widget.color,
            ),
            child: Text(
              widget.value,
              style: GoogleFonts.jost(
                color: colorWhite,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
