import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox sizedBox({double? width, double? height}) {
    return SizedBox(
      width: width?.h,
      height: height?.h,
    );
  }
