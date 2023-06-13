// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    this.leading,
    this.middle,
    this.actions,
    this.color,
    this.padding,
    this.height,
    Key? key,
  }) : super(key: key);

  List<Widget>? leading;
  List<Widget>? middle;
  List<Widget>? actions;
  int? color;
  EdgeInsets? padding;
  double? height;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, height?.h??40.h),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(color ?? 0x00000000),
          ),
          margin: EdgeInsets.only(top: 10.h),
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: leading ?? [Container()],
              ),
              Row(
                children: middle ?? [Container()],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: actions ??
                    [
                      Container(
                        width: 25.w,
                      )
                    ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
