import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kWelcomeBkg)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
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
                      sizedBox(
                          height: (MediaQuery.of(context).size.height / 2.4).h),
                       c.isAnimationCompleted
                          ? animatedUI()
                          : SlideUpAnimation(
                              child: animatedUI(),
                              animStatus: (status) {
                                if (status == AnimStatus.completed) {
                                  c.isAnimationCompleted = true;
                                }
                              },
                            ),
                          
                          
                      sizedBox(height: 110),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(
                  bottom: 64),
              child: 
              // SlideUpAnimation(
              //   child:
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () {
                              Get.toNamed(AppPages.PAYWALL);
                            }
                          
                    ),
              //),
            ),
          ));
    });
  }

  Column animatedUI() {
    return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingText(Strings.welcomeHeading.tr),
                            subHeadingText(Strings.welcomeSubHeading.tr),
                            sizedBox(height: 24),
                            discriptionText(Strings.welcomeDescText.tr)
                          ],
                        );
  }
}

