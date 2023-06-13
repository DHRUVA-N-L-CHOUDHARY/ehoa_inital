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
import '../controllers/edit_height.dart';

class EditHeightView extends StatelessWidget {
  const EditHeightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditHeightController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.profileEditBkgPng)),
        ),
        child: Scaffold(
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
                Strings.editHeight,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 14,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Obx(() => baseBody(c.isLoading.value, Container(
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
                              c.selectedMeter = c.mlist[val];
                              c.update();
                            },
                            childCount: c.mlist.length,
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
                                    c.selectedMeter.toString(),
                                    style: MyStyles.getTextStyle(
                                        color: Colors.white,
                                        fontFamily: AppFonts.kInterMedium,
                                        fontSize: 12.8),
                                  )),
                            ),
                            scrollController: FixedExtentScrollController(
                                initialItem: c.mlist.indexWhere((element) {
                                  return element == c.selectedMeter;
                                })),
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                    c.mlist[index].toString(),
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
                              decoration: BoxDecoration(
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
                              c.selectedCM = c.cmlist[val];
                              c.update();
                            },
                            childCount: c.cmlist.length,
                            diameterRatio: 5,
                            selectionOverlay: Container(
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: LightThemeColors.scrollerBarColor,
                              ),
                              child: Center(
                                  child: Text(
                                    c.selectedCM.toString(),
                                    style: MyStyles.getTextStyle(
                                        color: Colors.white,
                                        fontFamily: AppFonts.kInterMedium,
                                        fontSize: 12.8),
                                  )),
                            ),
                            scrollController: FixedExtentScrollController(
                                initialItem: c.cmlist.indexWhere((element) {
                                  return element == c.selectedCM;
                                })),
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                    c.cmlist[index].toString(),
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
                              c.selectedMSym = c.mSymlist[val];
                              c.update();
                            },
                            childCount: c.mSymlist.length,
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
                                initialItem: c.mSymlist.indexWhere((element) {
                                  return element == "m";
                                })),
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                    c.mSymlist[index].toString(),
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
          ))),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                    vertical: 16),
                child: AppOutlineButton(btnText: Strings.save, ontap: () {
                  c.saveProfile();

                }),
              )
            ],
          ),
        ),
      );
    });
  }
}
