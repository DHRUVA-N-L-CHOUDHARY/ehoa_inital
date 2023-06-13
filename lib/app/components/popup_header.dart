import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/light_theme_colors.dart';
import 'headings.dart';

class PopupHeader extends StatelessWidget {
  const PopupHeader({
    required this.headerText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String headerText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              closeIcon(onTap: onTap),
            ],
          ),
          sizedBox(height: 10),
          popupHeadingText(headerText),
          sizedBox(height: 16)
        ],
      ),
    );
  }

  static Widget closeIcon({VoidCallback? onTap}) {
    return InkWell(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child:
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.close, color: LightThemeColors.white80),
                    ));
  }
}
