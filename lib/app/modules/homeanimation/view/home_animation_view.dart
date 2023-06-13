import 'package:ehoa/app/components/anim_widget.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/homeanimation/controller/home_animation_controller.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';

class HomeAnimationView extends StatelessWidget {
  const HomeAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAnimationController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: false,
        backgroundColor: LightThemeColors.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: GestureDetector(
                child: Container(
                  height:
                      (MediaQuery.of(AppService.getContext()).size.height).h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.kanimBkg),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(AppService.getContext()).size.height * 0.1,
              //  left: MediaQuery.of(AppService.getContext()).size.width*0.25,
              child: Center(
                  child: subHeadingText(Strings.iamfeeling, fontSize: 18)),
            ),
            Positioned(
                top: MediaQuery.of(AppService.getContext()).size.height * 0.15,
                child: SizedBox(width: 500.w, child: AnimWidget())),
          ],
        ),
      );
    });
  }
}
