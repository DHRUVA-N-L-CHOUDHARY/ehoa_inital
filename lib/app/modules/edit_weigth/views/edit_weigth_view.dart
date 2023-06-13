
import 'dart:math';

import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/edit_weigth_controller.dart';

class EditWidthView extends StatelessWidget {
  const EditWidthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditWidthController>(
      builder: (c) {
       return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.profileEditBkgPng)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
            appBar: MyAppBar(
              leading: [
                MyIconButton(
                    onTap: () {
                      Get.back();
                    },
                    isSvg: true,
                    icon: AppIcons.kBackArrowIcon),
              ],
              middle: [
                Text(
                  Strings.editWeight,
                  style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterRegular,
                      fontSize: 14,
                      color: LightThemeColors.white90),
                )
              ],
            ),

            backgroundColor: Colors.transparent,
            body: Container(
              margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
              child: Column(
                children: [
                  sizedBox(height: 120),
                  c.isLoading.value!
                      ? Container()
                      : SizedBox(
                    //padding: EdgeInsets.only(bottom: 145.h, top: 50.h),
                    height: 200.h,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoPicker.builder(
                              itemExtent: 30.0,
                              onSelectedItemChanged: (val) {
                                c.selectedKg = c.kglist[val];
                                c.update();
                              },
                              childCount: c.kglist.length,
                              diameterRatio: 5,
                              selectionOverlay: Container(
                                height: 30.h,
                                decoration: BoxDecoration(
                                    color: LightThemeColors.scrollerBarColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.r),
                                        topLeft: Radius.circular(16.r)
                                    )
                                ),
                                child: Center(
                                    child: Text(
                                      c.selectedKg.toString(),
                                      style: MyStyles.getTextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    )),
                              ),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.kglist.indexWhere((element) {
                                    return element == c.selectedKg;
                                  })),
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                      c.kglist[index].toString(),
                                      style: MyStyles.getTextStyle(
                                          color: LightThemeColors.white90,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    ));
                              },
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker.builder(
                              itemExtent: 30.0,
                              onSelectedItemChanged: (val) {
                                c.selectedDot = c.dotlist[val];
                                c.update();
                              },
                              childCount: c.dotlist.length,
                              diameterRatio: 5,
                              selectionOverlay: Container(
                                height: 30.h,
                                decoration: const BoxDecoration(
                                  color: LightThemeColors.scrollerBarColor,
                                ),
                                child: Center(
                                    child: Text(
                                      c.selectedDot.toString(),
                                      style: MyStyles.getTextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    )),
                              ),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.dotlist.indexWhere((element) {
                                    return element == ".";
                                  })),
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                      c.dotlist[index].toString(),
                                      style: MyStyles.getTextStyle(
                                          color: LightThemeColors.white90,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    ));
                              },
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker.builder(
                              itemExtent: 30.0,
                              onSelectedItemChanged: (val) {
                                c.selectedGm = c.gmlist[val];
                                c.update();
                              },
                              childCount: c.gmlist.length,
                              diameterRatio: 5,
                              selectionOverlay: Container(
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: LightThemeColors.scrollerBarColor,
                                ),
                                child: Center(
                                    child: Text(
                                      c.selectedGm.toString(),
                                      style: MyStyles.getTextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    )),
                              ),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.gmlist.indexWhere((element) {
                                    return element == c.selectedGm;
                                  })),
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                      c.gmlist[index].toString(),
                                      style: MyStyles.getTextStyle(
                                          color: LightThemeColors.white90,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    ));
                              },
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker.builder(
                              itemExtent: 30.0,
                              onSelectedItemChanged: (val) {
                                c.selectedMSym = c.kgSymlist[val];
                                c.update();
                              },
                              childCount: c.kgSymlist.length,
                              diameterRatio: 5,
                              selectionOverlay: Container(
                                height: 30.h,
                                decoration: BoxDecoration(
                                    color: LightThemeColors.scrollerBarColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r),
                                        topRight: Radius.circular(16.r)
                                    )
                                ),
                                child: Center(
                                    child: Text(
                                      c.selectedMSym.toString(),
                                      style: MyStyles.getTextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    )),
                              ),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.kgSymlist.indexWhere((element) {
                                    return element == "m";
                                  })),
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                      c.kgSymlist[index].toString(),
                                      style: MyStyles.getTextStyle(
                                          color: LightThemeColors.white90,
                                          fontFamily: AppFonts.kInterMedium,
                                          fontSize: 12.8),
                                    ));
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                      vertical: 32),
                  child: AppOutlineButton(btnText: Strings.save, ontap: () {
                    c.saveProfile();

                  }),
                )
              ],
            ),
          ))),
        );
      }
    );
  }
}
