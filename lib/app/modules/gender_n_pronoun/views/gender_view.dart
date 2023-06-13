import 'package:ehoa/app/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/list_selection_tile.dart';
import '../../../components/popup_header.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/genderpronoun_controller.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenderNPronounController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kLocation2Bkg)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                sizedBox(height: 25),
                const PopupHeader(headerText: Strings.selectGender),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(c.genders.length, (index) {
                        return ListSelectionTile(
                          data: c.genders[index],
                          onTap: () {
                            c.genderCtlr.text = "";
                            c.genders.forEach((element) {
                              element.setIsSelected = false.obs;
                            });
                            c.genders[index].setIsSelected =
                                true.obs;
                            c.update();
                            c.selectedGender = c.genders[index];
                          },
                        );
                        //gendersSelectionTile(index);
                      }),
                    ),
                  ),
                ),
                AppTextField(
                  controller: c.genderCtlr,
                  labelText: Strings.whatBestDescribes,
                  onChanged: (_){
                    c.genders.forEach((element) {
                      element.setIsSelected = false.obs;
                    });
                    c.update();

                  },
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                )
              ],
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
                        Get.back();

                        }),
                  ],
                )),
          ));
    });
  }
}
