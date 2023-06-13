// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/modules/create_account/controllers/create_account_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/app_text_field.dart';
import '../../../components/headings.dart';
import '../../../components/sizedbox_util.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.kLoginBkg)),
        ),
        child: Obx(() => baseBody(
         c.isLoading.value , Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: c.isAnimationCompleted
                              ? createAccView(c)
                              : FadeInAnimation(
                            child: createAccView(c),
                            animDuration: const Duration(seconds: 1),
                            animStatus: (status) {
                              if (status == AnimStatus.completed) {
                                c.isAnimationCompleted = true;
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }

  Widget createAccView( CreateAccountController c) {
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
          headingText(Strings.createAnAccount.tr),
          sizedBox(
            height: 16,
          ),
          subHeadingText(Strings.createAccHelperText.tr),
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
            controller:c.passwordController,
            labelText: Strings.pwd.tr,
          ),
          sizedBox(height: 60),
          AppOutlineButton(
            btnText: Strings.signup.tr,
            ontap: () {
              c.registerUser();

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
                // c.socialLogin();

              },
              child: socialLoginButtons()),
        ]);
  }
}
