import 'package:ehoa/app/components/sizedbox_util.dart';
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
import '../../../components/common/app_utils.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/edit_age_controller.dart';

class EditAgeView extends StatelessWidget {
  const EditAgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAgeController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.profileEditBkgPng)),
        ),
        child:Obx(() => baseBody(c.isLoading.value, Scaffold(
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
                Strings.editAge,
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
                c.list.isEmpty
                    ? Container()
                    : SizedBox(
                  //padding: EdgeInsets.only(bottom: 145.h, top: 50.h),
                  height: 200.h,
                  child: CupertinoPicker.builder(
                    itemExtent: 45.0,
                    onSelectedItemChanged: (val) {

                      c.selectedAge(c.list[val].toString());

                    },
                    childCount: c.list.length,
                    diameterRatio: 5,

                    // useMagnifier: true,
                    selectionOverlay: Container(),
                    scrollController: FixedExtentScrollController(
                        initialItem: c.list.indexWhere((element) {
                          int? defaultvalue = 2000;
                          if (c.selectedAge.value.isNotEmpty) {
                            defaultvalue = int.tryParse(c.selectedAge.value);
                          }
                          defaultvalue =defaultvalue??2000;
                          return element == defaultvalue;
                        })),
                    magnification: 1.3,
                    itemBuilder: (context, index) {
                      return Center(
                          child: Text(
                            c.list[index].toString(),
                            style: MyStyles.getTextStyle(
                                color: LightThemeColors.white90,
                                fontFamily: AppFonts.kInterMedium,
                                fontSize: 12.8),
                          ));
                    },
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
                    vertical: 16),
                child: AppOutlineButton(btnText: Strings.save, ontap: () {
                  c.saveProfile();

                }),
              )
            ],
          ),
        ))),
      );
    });
  }
}
