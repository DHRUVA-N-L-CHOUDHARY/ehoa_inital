
import 'package:ehoa/app/components/common/app_utils.dart';
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
import '../../../components/list_selection_tile.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../../../data/local/data_list_model.dart';
import '../controllers/edit_pronoun_controller.dart';


class EditPronounView extends StatelessWidget {
  const EditPronounView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPronounController>(
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
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
                  Strings.editPronoun,
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
                      children: List.generate(c.pronouns.length, (index) {
                        return ListSelectionTile(
                          data: c.pronouns[index],
                          onTap: () {
                            c.pronounCtlr.text = "";
                            c.pronouns.forEach((element) {
                              element.setIsSelected = false.obs;
                            });
                            c.pronouns[index].setIsSelected = true.obs;
                            c.update();
                            c.selectedPronoun = c.pronouns[index];
                          },
                        );
                        //ListSelectionTile(index);
                      }),
                    ),
                  ),
                ),
                AppTextField(
                  controller: c.pronounCtlr,
                  labelText: Strings.whatBestDescribes,
                  onChanged: (_){
                    if (c.selectedPronoun?.itemId?.length==1) {
                      c.pronouns.forEach((element) {
                        element.setIsSelected = false.obs;
                      });
                    }
                    c.selectedPronoun= DataList(
                        isSelected: RxBool(false), itemName: c.pronounCtlr.text, itemId: c.pronounCtlr.text);
                    c.update();

                  },
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
                  child: AppOutlineButton(btnText: Strings.save, ontap: () {
                    c.saveProfile();

                  }),
                )
              ],
            ),
          ))),
        );
      }
    );
  }
}
