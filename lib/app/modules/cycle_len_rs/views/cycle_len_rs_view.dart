
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/reporting_system/views/reporting_system_view.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/cycle_len_rs_controller.dart';

class RSCycleLenView extends StatelessWidget {
  const RSCycleLenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RSCycleLenController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
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
                    Strings.cycleLen,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  )
                ],
              ),backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              sizedBox(height: 48),
              GlassContainer(
                margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                child: 
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(AppImages.rsMoonPng, width: 28.w, height: 28.h,),
                sizedBox(width: 32),
                headingText(Strings.rsCycleLenHeading)
              ],)
              ),
              sizedBox(height: 8),
              Center(child: subHeadingText(Strings.resCycleLenSubHead)),
              sizedBox(height: 64),
              Container(
                margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: GlassContainer(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("29 Days", style: MyStyles.getTextStyle(fontFamily: AppFonts.kInterBold, fontSize: 28),),
                        sizedBox(height: 12),
                        subHeadingText(Strings.avgCycleLen),
                      ],
                    ),)),
                    sizedBox(width: 17),
                    Expanded(child: GlassContainer(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("5 Days", style: MyStyles.getTextStyle(fontFamily: AppFonts.kInterBold, fontSize: 28),),
                        sizedBox(height: 12),
                        subHeadingText(Strings.avgPeriodLen),
                      ],
                    ),))
                  ],
                ),
              ),
              sizedBox(height: 60),
              Container(
                margin: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                height: 300,
                width: double.infinity,
                child: Image.asset(AppImages.gr1Png, fit: BoxFit.fill,),
              ),
              sizedBox(height: 10),
              Center(child: subHeadingText("Graph is a sample img", fontSize: 10),)
            ],
          ),
          ));
      }
    );
  }
}
