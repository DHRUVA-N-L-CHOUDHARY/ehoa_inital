// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/modules/login/controllers/login_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/headings.dart';
import '../../../components/sizedbox_util.dart';
import '../../../components/utility_widgets.dart';
import '../../../routes/app_pages.dart';
import '../../tnc/views/tnc_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (c) {
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.kLoginBkg)),
            ),
            child: Obx(() => baseBody(c.isLoading.value, Scaffold(
              backgroundColor: Colors.transparent,
              body:  ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: c.isAnimationCompleted
                                ?  createAccView(c)
                                : FadeInAnimation(
                              child:  createAccView(c),
                              animDuration:  AppConstants.appUiAnimationDuration,
                              animStatus: (status) {
                                if (status == AnimStatus.completed) {
                                  c.isAnimationCompleted = true;
                                }

                              },
                            )

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))),
        );
      }
    );
  }

  Widget createAccView(LoginController c) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(
            height: 30,
          ),
          backIcon(onTap: () {
            Get.back();
          }),
          sizedBox(
            height: 24,
          ),
          headingText(Strings.welcomeBack.tr),
          sizedBox(
            height: 16,
          ),
          subHeadingText(Strings.loginSubTxt.tr),
          sizedBox(
            height: 71,
          ),
          AppTextField(
            controller: c.emailController,
            labelText: Strings.email.tr,
          ),
          sizedBox(
            height: 20,
          ),
          AppTextField.password(
            controller: c.passwordController,
            labelText: Strings.pwd.tr,
          ),
          InkWell(
            onTap: () {
               c.forgotPassword();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(Strings.forgotStr.tr,
                    style: MyStyles.getTextStyle(
                        fontSize: 14.0, fontFamily: AppFonts.kInterSemibold)),
              ),
            ),
          ),
          sizedBox(height: 60),
          AppOutlineButton(
            btnText: Strings.loginTxt.tr,
            ontap: () {
              c.login();
            },
          ),
          sizedBox(
            height: 34,
          ),
          divider(),
          sizedBox(
            height: 30,
          ),
          InkWell(
              onTap: (){
                c.socialLogin();


              },
              child: socialLoginButtons()),


        ]);
  }
}
