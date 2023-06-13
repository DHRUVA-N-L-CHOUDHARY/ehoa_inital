import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/calendar/views/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/cycle_details_controller.dart';

class CycleDetailsView extends StatelessWidget {
  const CycleDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CycleDetailsController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.gradBkgPng), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(80.0), // here the desired height
              child: MyAppBar(
                color: 0x00000000,
                leading: [
                  MyIconButton(
                      onTap: () {
                        Get.back();
                      },
                      isSvg: true,
                      icon: AppIcons.kBackArrowIcon)
                ],
                middle: [
                  Text(
                    Strings.thisCylesEnergy,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              )),
          body: ListView(
            children: [
              sizedBox(height: 34),
              SizedBox(
                height: 150.h,
                width: 150.w,
                child: Image.asset(AppIcons.cycleeEnergyGraphic),
              ),
              Center(
                  child: Text(
                Strings.cycleStartedOn,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterSemibold, fontSize: 8),
              )),
              sizedBox(height: 4),
              Center(
                  child: subHeadingText(
                Strings.cycleName,
              )),
              sizedBox(height: 60),
              Container(
                margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subHeadingText("${Strings.currCycle}: ${DateTime.now().day} day", fontSize: 18),
                    Text(
                      "May 16 - June 16",
                      style: MyStyles.getTextStyle(
                        fontSize: 8,
                      ),
                    ),
                    sizedBox(height: 12),
                    InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: null,
                      child: Container(
                        decoration: MyDecoration.getGlassDecoration(),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 8.w),
                        child: Center(
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            children:
                                List.generate(c.calC.moonList1.length, (index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      color: c.calC.moonList1[index].isSelected!
                                          ? LightThemeColors.moonHighlightColor
                                          : Colors.transparent,
                                      borderRadius:
                                          CalendarView.getBorderRadius(
                                              c.calC.moonList1, index)),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: SvgPicture.asset(
                                    c.calC.moonList1[index].icon!,
                                    color: Color(c.calC.moonList1[index].color!),
                                  ));
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBox(height: 56),
              SeeReportButton(text: Strings.seeThisMonthRepo, onTap: () {}),
              sizedBox(height: 70),
              Center(child: subHeadingText(Strings.energyHistory)),
              sizedBox(height: 25),
              Container(
                padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                    vertical: 19),
                decoration: MyDecoration.getGlassDecoration(radius: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 20.w),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: LightThemeColors.glassStrokColor,
                                    width: 2.w),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("28 Days Cycle",
                                    style: MyStyles.getTextStyle(
                                        fontFamily: AppFonts.kInterMedium,
                                        fontSize: 18)),
                                 Text("19 May - 17 June",
                                      style: MyStyles.getTextStyle(
                                          fontFamily: AppFonts.kInterSemibold,
                                          fontSize: 8)),
                                
                                sizedBox(height: 16),
                               Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        color: EnergyLevelColors.noEnergy),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.thunderSvg,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        sizedBox(width: 2),
                                        Text("Low Energy Month",
                                            style: MyStyles.getTextStyle(
                                                color: EnergyLevelColors
                                                    .veryHighEnergy,
                                                fontSize: 8,
                                                fontFamily:
                                                    AppFonts.kInterSemibold)),
                                      ],
                                    ),
                                  ),
                                
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  AppIcons.smpleCycleImg,
                                  width: 30.w,
                                  height: 30.w,
                                ),
                                sizedBox(height: 9),
                                Center(
                                    child: Text(
                                  Strings.cycleStartedOn,
                                  style: MyStyles.getTextStyle(
                                      fontFamily: AppFonts.kInterSemibold,
                                      fontSize: 8),
                                )),
                                sizedBox(height: 4),
                                Center(
                                    child: subHeadingText(
                                  Strings.cycleName,
                                )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    sizedBox(height: 41),
                    subHeadingText(
                      Strings.energyDays,
                    ),
                    sizedBox(height: 6),
                    Container(
                      decoration: MyDecoration.getGlassDecoration(),
                      padding:
                          EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                      child: Center(
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          runSpacing: 16,
                          children: List.generate(c.moonList2.length, (index) {
                            return Container(
                                decoration: BoxDecoration(
                                    color: c.moonList2[index].isSelected!
                                        ? LightThemeColors.moonHighlightColor
                                        : Colors.transparent,
                                    borderRadius: CalendarView.getBorderRadius(
                                        c.moonList2, index)),
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: SvgPicture.asset(
                                  c.moonList2[index].icon!,
                                  color: Color(c.moonList2[index].color!),
                                ));
                          }),
                        ),
                      ),
                    ),
                    sizedBox(height: 57),
                    SeeReportButton(
                        text: Strings.seeThisMonthRepo, onTap: () {})
                  ],
                ),
              ),
              sizedBox(height: 116)
            ],
          ),
        ),
      );
    });
  }
}
