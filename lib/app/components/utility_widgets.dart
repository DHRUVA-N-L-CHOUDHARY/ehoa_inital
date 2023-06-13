import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../config/theme/my_styles.dart';
import '../../config/translations/strings_enum.dart';
import '../../utils/constants.dart';
import 'app_icon_btn.dart';

Row socialLoginButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: AppIconButton(
          icon: const Icon(
            Ionicons.logo_google,
            color: Colors.red,
          ),
          onTap: (){
          Get.toNamed(AppPages.BASE);
          },
        ),
      ),
      sizedBox(
        width: 16,
      ),
      Expanded(
          child: AppIconButton(
        icon: const Icon(
          Icons.apple,
          color: Colors.black,
        ),
        onTap: (){
          Get.toNamed(AppPages.BASE);
        },
      )),
      sizedBox(
        width: 16,
      ),
      Expanded(
        child: AppIconButton(
          icon: const Icon(Icons.facebook),
          onTap: (){
          Get.toNamed(AppPages.BASE);
          },
        ),
      )
    ],
  );
}

Row divider() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 1.5.h,
          color: Colors.white70,
        ),
      ),
      sizedBox(
        width: 16,
      ),
      Text(
        Strings.or.tr,
        style: MyStyles.getTextStyle(
            color: Colors.white70,
            fontSize: 14.0,
            fontFamily: AppFonts.kInterRegular),
      ),
      sizedBox(
        width: 16,
      ),
      Expanded(
        child: Container(
          height: 1.5.h,
          color: Colors.white70,
        ),
      )
    ],
  );
}

Widget backIcon({VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: SvgPicture.asset(
      AppIcons.kBackArrowIcon,
      width: 19.w,
      height: 31.h,
    ),
  );
}
