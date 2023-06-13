import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/location/controllers/location_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/list_selection_tile.dart';
import '../../../components/popup_header.dart';
import '../../tnc/views/tnc_view.dart';

class LocationCountyView extends StatelessWidget {
  const LocationCountyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kLocation2Bkg)),
          ),
          child: baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                sizedBox(height: 25),
                sizedBox(height: 25),
                const PopupHeader(headerText: Strings.enterTheCountryYouRin),
                Expanded(
                    child: SingleChildScrollView(
                      child: c.isCAnimationCompleted
                          ? animatedUI(c)
                          : FadeInAnimation(
                        child: animatedUI(c),
                        animDuration: const Duration(seconds: 1),
                        animStatus: (status) {
                          if (status == AnimStatus.completed) {
                            c.isCAnimationCompleted = true;
                          }
                        },
                      ),
                    ))
              ],
            ),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(top: 24.h),
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                height: 90.h,
                child: Wrap(
                  children: [
                    AppOutlineButton(
                        btnText: Strings.fillOutLater.tr, ontap: () {
                      Get.toNamed(AppPages.NAME);


                    }),
                  ],
                )),
          )));
    });
  }

  Widget animatedUI(LocationController c) {
    return Column(
                    children: List.generate(c.list.length, (index) {
                      return ListSelectionTile(
                        data: c.list[index],
                        onTap: () {
                          for (var element in c.list) {
                            element.setIsSelected = false.obs;
                          }
                          c.list[index].setIsSelected = RxBool(!c.list[index].getIsSelected!.value);
                          c.update();
                          c.selectedData = c.list[index];
                          c.selectedTribe = null;
                          c.iwiHapu.setIsSelected = false.obs;
                          Get.toNamed(AppPages.LOCATION_TRIBE);
                        },
                      );
                      //ListSelectionTile(index);
                    }),
                  
              );
  }
}


