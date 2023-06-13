 import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/my_fonts.dart';
import '../../config/theme/my_styles.dart';
import '../../utils/constants.dart';

Text subHeadingText(String text,{double? fontSize, Color? color, TextAlign? textAlign}) {
    return Text(
      text,
      style: MyStyles.getTextStyle(color: color??LightThemeColors.white80, fontSize: fontSize?.sp??MyFonts.subHeadingTextSize, fontFamily: AppFonts.kInterMedium), textAlign: textAlign,
    );
  }

  Text popupHeadingText(String text,{double? fontSize, Color? color}) {
    return Text(
      text,
      style: MyStyles.getTextStyle(color: color??LightThemeColors.white80, fontSize: fontSize?.sp??MyFonts.subHeadingTextSizeS, fontFamily: AppFonts.kInterRegular),
    );
  } 

  Text headingText(String? text, {double? fontSize, Color? color} ) {
    return Text(
      text!,
      style: MyStyles.getTextStyle(
        color: color??Colors.white,
          fontSize: fontSize?.sp?? MyFonts.headingTextSizeM,
          fontFamily: AppFonts.kBelyDisplayRegularFont),
    );
  }

  Text discriptionText(String? text, {double? fontSize, Color? color,TextAlign? textAlign} ) {
    return Text(
      text!,
      textAlign: textAlign,
      style: MyStyles.getTextStyle(
          color: color??LightThemeColors.white90,
          fontSize: fontSize?.sp?? MyFonts.descriptionTextSize,
          fontFamily: AppFonts.kInterRegular),
    );
  }
