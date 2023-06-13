
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/common/app_utils.dart';
import '../../../components/field_decorator.dart';
import '../../../components/headings.dart';
import '../../../components/list_selection_tile.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../../../data/local/data_list_model.dart';
import '../controllers/edit_gender_controller.dart';

class EditGenderView extends StatelessWidget {
  const EditGenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditGenderController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
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
                  Strings.editGender,
                  style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterRegular,
                      fontSize: 14,
                      color: LightThemeColors.white90),
                )
              ],
            ),

            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                sizedBox(height: 25),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(c.genders.length, (index) {
                        return ListSelectionTile(
                          data: c.genders[index],
                          onTap: () {
                            c.genders.forEach((element) {
                              element.setIsSelected= false.obs;

                            });
                            c.genderCtlr.text ="";
                            c.genders[index].setIsSelected = RxBool(true);
                            c.selectedGender = c.genders[index];
                            c.update();
                          },
                        );
                        //gendersSelectionTile(index);
                      }),
                    ),
                  ),
                ),
                AppTextField(
                  controller: c.genderCtlr,
                  onChanged: (_){
                  if (c.selectedGender?.itemId?.length==1) {
                    c.genders.forEach((element) {
                      element.setIsSelected= false.obs;

                    });
                  }
                   c.selectedGender= DataList(
                        isSelected: RxBool(false), itemName:c.genderCtlr.text, itemId:c.genderCtlr.text);
                    c.update();
                  },
                  labelText: Strings.whatBestDescribes,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                )
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                      vertical: 16),
                  child: AppOutlineButton(btnText: Strings.save, ontap: (c.selectedGender!=null  )?() {
                    c.saveProfile();

                  }:null),
                )
              ],
            ),
          ))),
        );
      }
    );
  }
}
