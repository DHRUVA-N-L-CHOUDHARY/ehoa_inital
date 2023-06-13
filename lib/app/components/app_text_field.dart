// ignore_for_file: must_be_immutable

import 'package:ehoa/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/my_styles.dart';
import '../../utils/constants.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    required this.controller,
    this.onChanged,
    this.height = 58,
    this.radius = 8.0,
    this.padding,
    this.maxLines = 1,
    this.cursorHeight = 15.0,
    this.labelText = "",
    this.contentPadding,
    this.isPwdMode = false,
    this.suffixIcon,
    this.margin,
    this.focusNode,
    Key? key,
  }) : super(key: key) {
    isObscure = RxBool(false);
  }

  AppTextField.password({
    required this.controller,
    this.onChanged,
    this.height = 58,
    this.radius = 8.0,
    this.margin,
    this.maxLines = 1,
    this.cursorHeight = 15.0,
    this.labelText = "",
    this.contentPadding,
    this.isPwdMode = true,
    this.suffixIcon,
    this.padding,
    this.focusNode,
    Key? key,
  }) : super(key: key) {
    isObscure = RxBool(true);
  }

  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final int? maxLines;
  final double? cursorHeight;
  final String? labelText;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? isPwdMode;
  RxBool? isObscure;
  Widget? suffixIcon;
  EdgeInsets? margin;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Container(
            height: height!.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(radius!.r),
            ),
          ),
          Padding(
            padding: padding ??
                EdgeInsets.only(left: 12.w, right: 12.w, top: 8.h, bottom: 4.h),
            child: Obx(() => TextField(
                  focusNode: focusNode,
                  controller: controller,
                  onChanged: onChanged ?? (t) {},
                  cursorColor: Colors.white,
                  maxLines: maxLines,
                  cursorHeight: cursorHeight!.h,
                  obscureText: isObscure!.value,
                  decoration: InputDecoration(
                      floatingLabelStyle: MyStyles.getTextStyle(
                          color: Colors.white70,
                          fontFamily: AppFonts.kInterRegular,
                          fontSize: MyFonts.hintOrLableTextSize),
                      labelText: labelText,
                      contentPadding: contentPadding ?? EdgeInsets.zero,
                      border: InputBorder.none,
                      suffixIcon: isPwdMode!
                          ? isObscure!.value
                              ? InkWell(
                                  onTap: () {
                                    isObscure!.value = !isObscure!.value;
                                  },
                                  child: const Icon(Icons.visibility_off,
                                      color: Colors.white70))
                              : InkWell(
                                  onTap: () {
                                    isObscure!.value = !isObscure!.value;
                                  },
                                  child: const Icon(Icons.visibility,
                                      color: Colors.white70))
                          : suffixIcon),
                  style: MyStyles.getTextStyle(
                      fontSize: MyFonts.textFieldOrContentSize,
                      fontFamily: AppFonts.kInterMedium),
                )),
          )
        ],
      ),
    );
  }
}
