import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/my_icon_button.dart';
import '../controllers/PageContentController.dart';

class PageContentView extends StatelessWidget {
  const PageContentView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageContentController>(
        builder: (c) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
            ),
            child:Scaffold(
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
                  Obx(() => Text(
                    c.title.value,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 14,
                        color: LightThemeColors.white90),
                  ))
                ],
              ),

              backgroundColor: Colors.transparent,
              body: Obx(() => baseBody(c.isLoading.value, c.isLoading.value?Container():ListView(
                children: [
                  HtmlContentViewer(
                    customStyleCssTag: "body {background: #011135; color:white;} ",

                    initialContentHeight: MediaQuery.of(context).size.height,
                    initialContentWidth: MediaQuery.of(context).size.width,
                    htmlContent: c.description.value,

                  ),


                ],
              ))),

            ),
          );
        }
    );
  }
}
