import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/light_theme_colors.dart';
import '../../config/theme/my_fonts.dart';
import '../../config/theme/my_styles.dart';
import '../../utils/constants.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    required this.btnText,
    required this.ontap,
    this.color = 0xffffffff,
    this.filledTextColor,
    this.disabledColor = 0xffD0D5DD,
    this.padding,
    this.radius = 8.0,
    this.isFilled = true,
    this.height,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  final double? radius;
  final int? color;
  final int? filledTextColor;
  final int? disabledColor;
  final VoidCallback? ontap;
  final EdgeInsets? padding;
  final String? btnText;
  final bool? isFilled;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!.r),
          ),
          backgroundColor: !isFilled!
              ? Colors.transparent
              : Color(ontap == null ? disabledColor! : color!),
          side: BorderSide(
            color: Color(ontap == null ? disabledColor! : color!),
            width: 1,
          ),
        ),
        onPressed: ontap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(13.0),
          child: Text(btnText ?? "",
              style: MyStyles.getTextStyle(
                  color: !isFilled!
                      ? Colors.white
                      : filledTextColor == null
                          ? LightThemeColors.outlinedBtnTextColor
                          : Color(filledTextColor!),
                  fontFamily: AppFonts.kInterMedium,
                  fontSize: fontSize?.sp?? MyFonts.buttonTextSize)),
        ),
      ),
    );
  }
}
