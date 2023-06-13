import 'package:ehoa/app/components/app_text_field.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_fonts.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/list_selection_tile.dart';
import '../../../components/popup_header.dart';
import '../../../components/sizedbox_util.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/location_controller.dart';

class LocationTribeView extends StatelessWidget {
  const LocationTribeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (c) {
      return GestureDetector(
        onTap: () {
          c.showDDOptions = false;
          c.focusNode!.unfocus();
          c.update();
        },
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.kLocation2Bkg)),
            ),
            child: Obx(() => baseBody(
                c.isLoading.value,
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: c.isTAnimationCompleted
                      ? animatedUI(c, context)
                      : FadeInAnimation(
                    child: animatedUI(c, context),
                    animDuration: AppConstants.appUiAnimationDuration,
                    animStatus: (status) {
                      if (status == AnimStatus.completed) {
                        c.isTAnimationCompleted = true;
                      }
                    },
                  ),
                  bottomNavigationBar: Container(
                      margin: EdgeInsets.only(top: 24.h),
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      height: 90.h,
                      child: Wrap(
                        children: [
                          AppOutlineButton(
                              btnText: Strings.next.tr,
                              ontap: () {
                                c.saveCountry();
                                /*  Get.until((route) {
                              return Get.currentRoute == AppPages.LOCATION;
                            });*/
                              }),
                        ],
                      )),
                )))),
      );
    });
  }

  Widget animatedUI(LocationController c, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBox(height: 25),
          const PopupHeader(headerText: Strings.enterTheCountryYouRin),
          ListSelectionTile(
              data: c.selectedData!,
              onTap: () {
                Get.back();
              }),
          ListSelectionTile(
              data: c.iwiHapu,
              onTap: () {
                c.iwiHapu.setIsSelected = RxBool(!c.iwiHapu.getIsSelected!.value);
                c.selectedTribe = null;
                c.iwiHapuCtrl.text ="";
                c.update();
              }),
          c.iwiHapu.isSelected?.value??false== true? Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                // color: Colors.orange,
                width: double.infinity,
                height: 280.h,
              ),
              Positioned(
                  //top: 58.h,
                  child: !c.showDDOptions!
                      ? Container()
                      : Container(
                          height: 200.h,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          padding: EdgeInsets.only(top: 58.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                          child: MediaQuery.removeViewPadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                              itemCount: c.tribeList.length,
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (c.tribeList[index].itemId.toString() ==
                                        "-1") {
                                      c.selectedTribe = DataList(
                                          itemName: c.iwiHapuCtrl.text.trim(),
                                          itemId: '-1');
                                      c.focusNode!.unfocus();
                                    } else {
                                      c.iwiHapuCtrl.text =
                                          c.tribeList[index].itemName.toString();
                                      c.focusNode!.unfocus();
                                      c.selectedTribe = c.tribeList[index];
                                    }
                                    c.update();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.h, vertical: 16.h),
                                    child: Text(
                                      c.tribeList[index].itemName.toString(),
                                      style: MyStyles.getTextStyle(
                                          fontSize:
                                              MyFonts.textFieldOrContentSize,
                                          fontFamily: AppFonts.kInterMedium,
                                          color: LightThemeColors.white90),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ))),
              Positioned(
                child: AppTextField(
                  controller: c.iwiHapuCtrl,
                  labelText: Strings.enterIwiHapuName.tr,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  focusNode: c.focusNode,
                  onChanged: (t) {
                    if (t.trim().isNotEmpty) {
                      c.search(t.trim());
                    } else {
                      c.tribeList.clear();
                      c.tribeList.addAll(c.tribeBaseList);
    
                      c.update();
                    }
                  },
                ),
              ),
            ],
          ):Container(),
        ],
      ),
    );
  }
}
