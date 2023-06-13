// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_fonts.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/field_decorator.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/genderpronoun_controller.dart';

class GenderNPronounView extends StatelessWidget {
  const GenderNPronounView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenderNPronounController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kGpBkg)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                c.isAnimationCompleted
                    ? animatedUI(c)
                    : FadeInAnimation(
                  child: animatedUI(c),
                  animDuration:  AppConstants.appUiAnimationDuration,
                  animStatus: (status) {
                    if (status == AnimStatus.completed) {
                      c.isAnimationCompleted = true;
                    }
                  },
                ),
              ],
            ),
            bottomNavigationBar: Padding(
                padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(bottom: 32),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppOutlineButton(
                          btnText: Strings.next.tr,
                          ontap: (c.selectedGender!=null && c.selectedPronoun!=null )?() {
                            c.saveGenderPronoun();
                          }:null),
                      sizedBox(height: 35), Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PageIndicator(
                            isTransparent: false,
                          ),
                          sizedBox(width: 8),
                          PageIndicator(isTransparent: false,),
                          sizedBox(width: 8),
                          PageIndicator(isTransparent: false,),
                          sizedBox(width: 8),
                          PageIndicator(isTransparent: false,),
                          sizedBox(width: 8),
                          PageIndicator(),
                          sizedBox(width: 8),
                          PageIndicator(),
                          sizedBox(width: 8),
                          PageIndicator(),
                        ],
                      ),
                    ])),
          ))));
    });
  }

  Container animatedUI(GenderNPronounController c) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(
                      height: 30,
                    ),
                    backIcon(onTap: () {
                      Get.back();
                    }),
                    sizedBox(height: 35),
                    headingText(Strings.gpHeading.tr),
                    subHeadingText(Strings.gpSubHeading.tr),
                    sizedBox(height: 24),
                    discriptionText(Strings.gpDescText.tr),
                    sizedBox(height: 60),
                    GestureDetector(
                      onTap: () async {
                       await  Get.toNamed(AppPages.PRONOUN);
                        if (c.pronounCtlr.text.isNotEmpty) {
                          c.selectedPronoun= DataList(itemName: c.pronounCtlr.text);

                        }
                       c.update();

                      },
                      child: FieldDecorator(
                        child: child(c.selectedPronoun, Strings.selectPronoun.tr),
                      ),
                    ),
                    sizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                            await Get.toNamed(AppPages.GENDER);
                            if (c.genderCtlr.text.isNotEmpty) {
                              c.selectedGender= DataList(itemName: c.genderCtlr.text);

                            }
                            c.update();

                      },
                      child: FieldDecorator(
                        child: child(c.selectedGender, Strings.selectGender.tr),
                      ),
                    ),
                  ],
                ),
              );
  }

  Row child(DataList? data, String text) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        data == null
            ? Text(
                text,
                style: MyStyles.getTextStyle(
                    fontSize: MyFonts.textFieldOrContentSize,
                    fontFamily: AppFonts.kInterRegular,
                    color: LightThemeColors.white80),
              )
            : Text(data.itemName.toString(),
                style: MyStyles.getTextStyle(
                  fontSize: MyFonts.captionTextSize,
                  fontFamily: AppFonts.kInterMedium,
                  color: LightThemeColors.white90,
                )),
        const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        )
      ],
    );
  }
}
