import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/headings.dart';
import '../../../components/my_icon_button.dart';
import '../../reporting_system/views/reporting_system_view.dart';
import '../controllers/monthy_mood_controller.dart';

class MonthlyMoodView extends StatelessWidget {
  const MonthlyMoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonthlyMoodController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
          ),
          child: SafeArea(
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
                    Strings.mood,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Scaffold(
                appBar: MyAppBar(
                  leading: [
                    MyIconButton(
                        onTap: () {
                         // Get.back();
                        },
                        isSvg: true,
                        icon: AppIcons.kBackArrowIcon),
                  ],
                  middle: [
                    Text(
                      Strings.currCycle,
                      style: MyStyles.getTextStyle(
                          fontFamily: AppFonts.kInterRegular,
                          fontSize: 14,
                          color: LightThemeColors.white90),
                    )
                  ],
                  actions: [
                    MyIconButton(
                        onTap: () {
                         // Get.back();
                        },
                        isSvg: true,
                        icon: AppIcons.kRightArrowIcon),
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: PageView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 22.w),
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: double.infinity,
                            child: Image.asset(
                              AppImages.gr3Png,
                              fit: BoxFit.fill,
                            ),
                          ),
                          sizedBox(height: 20),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 22.w),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 12.h,
                                      mainAxisSpacing: 16.w,
                                      mainAxisExtent: 50.h,
                                    ),
                                    itemCount: c.moodList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.r),
                                          color: LightThemeColors.white5,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                c.moodList[index].moodName!,
                                                style: MyStyles.getTextStyle(
                                                    fontFamily:
                                                        AppFonts.kInterRegular,
                                                    fontSize: 12),
                                              ),
                                              Container(
                                                height: 16.h,
                                                width: 16.w,
                                                decoration: BoxDecoration(
                                                  color: Color(c.moodList[index].moodColor??0xff000000),
                                                  borderRadius: BorderRadius.circular(32.r)
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )),
                              sizedBox(height: 80),
                              GlassContainer(
                                margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                          child: Column(
                            children: [
                              headingText(Strings.feelScared),
                              sizedBox(height: 8),
                              subHeadingText(Strings.feelScaredSub),
                              sizedBox(height: 32),
                              AppOutlineButton(
                                  btnText: Strings.trySomeMed, ontap: () {})
                            ],
                          ),
                        ),
                        sizedBox(height: 80),
                      
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
