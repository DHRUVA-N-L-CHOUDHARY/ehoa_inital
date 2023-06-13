import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/notification/controllers/notification_controller.dart';
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

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kNotiBkg)),
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
                          height:
                              (MediaQuery.of(context).size.height / 2.75).h),
                      c.isAnimationCompleted
                          ? animatedUI()
                          : SlideUpAnimation(
                              child: animatedUI(),
                              animStatus: (status) {
                                if (status == AnimStatus.completed) {
                                  c.isAnimationCompleted = true;
                                }
                              },
                            )
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
                  //           child:
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () async{
                        c.userOnboardingController
                            .updateusernotificationsts("1");
                        await    c.userOnboardingController.registeraccount();
                        Get.toNamed(AppPages.BASE);
                      }
                      //     ),
                      ),
            ),
          ));
    });
  }

  Column animatedUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText(Strings.notificationHeading.tr),
        subHeadingText(Strings.notificatioSubHeading.tr),
        sizedBox(height: 24),
        discriptionText(Strings.notificationDescText.tr),
        sizedBox(height: 29),
        discriptionText(Strings.notificationDescText2.tr),
      ],
    );
  }
}
