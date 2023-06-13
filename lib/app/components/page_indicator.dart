// ignore_for_file: must_be_immutable

import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator({
    this.isTransparent = true,
    this.showCheck = false,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);
  bool? showCheck;
  bool? isTransparent;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h??14.h,
      width: width?.w??14.w,
      decoration: BoxDecoration(
          color: isTransparent!
              ? Colors.transparent
              : showCheck!
                  ? Colors.transparent
                  : LightThemeColors.white90,
          borderRadius: BorderRadius.circular(28.r),
          border: (showCheck! && !isTransparent!)
              ? null
              : Border.all(
                  color: LightThemeColors.white90,
                )),
      child: (showCheck! && !isTransparent!)
          ? Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: Icon(
                    Icons.check_circle,
                    color: LightThemeColors.white90,
                    size: 15.h,
                  )))
          : null,
    );
  }
}
