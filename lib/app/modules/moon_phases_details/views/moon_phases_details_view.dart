import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/headings.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/moon_phases_details_controller.dart';

class MoonPhasesDetailsView extends StatelessWidget {
  const MoonPhasesDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoonPhasesDetailsController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.moonPhBkg,
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                Get.back();
                // c.tipsCtrl.changePage(TipSelection.eneryTip);
              },
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: LightThemeColors.white90,
              ),
            ),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height.h,
              margin:
                  // MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: (MediaQuery.of(context).size.height * 0.08).h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
              decoration: BoxDecoration(
                color: LightThemeColors.glassBkgColor,
                border: Border.all(color: LightThemeColors.glassStrokColor),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(AppImages.kKoru),
                  ),
                  sizedBox(height: 80),
                  headingText("Whiro"),
                  sizedBox(height: 6),
                  subHeadingText(Strings.loremPara),
                  sizedBox(height: 10),
                  subHeadingText(Strings.loremPara),
                  sizedBox(height: 48),
                  AppOutlineButton(btnText: Strings.goBack, ontap: () {})
                ],
              )),
        ),
      );
    });
  }
}
