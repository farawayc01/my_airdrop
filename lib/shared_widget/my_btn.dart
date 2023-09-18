import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class IniButton extends StatelessWidget {
  final String title;
  final FontWeight textWeight;
  final double textSize;
  VoidCallback onTap;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  IniButton({
    super.key,
    required this.title,
    required this.textColor,
    required this.textWeight,
    required this.textSize,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          // margin: const EdgeInsets.only(left: 10, right: 10).w,
          width: double.infinity,
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: backgroundColor),
          child: Container(
            margin: const EdgeInsets.all(5).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: borderColor, width: 3),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: textWeight,
                  fontSize: textSize,
                ),
              ),
            ),
          )),
    );
  }
}
