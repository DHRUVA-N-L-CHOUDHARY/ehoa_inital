import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/apiModels/MyProfileRes.dart';
import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';

class CreateAccountController extends GetxController {
  bool isAnimationCompleted = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserOnboardingController userOnboardingController =
      Get.find();
  RxBool isLoading = false.obs;
  Auth0 auth0 = Auth0(
      'dev-xaoieegxph0mwc8w.us.auth0.com', 'Jz6KIuNPDDiWnjbeZfoU7Ecojs7gkSwN');

  Future registerUser() async {
    if (!validateEmail(emailController.text)) {
      DialogHelper.showErrorDialog("Required", "Please enter a valid email");
      return;
    } else if (!validatePassword(passwordController.text)) {
      DialogHelper.showErrorDialog("Required",
          "Password should contain Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Number\nMinimum\n1 Special Character");
      return;
    } else {
      isLoading(true);
      Map<String, String> data = {
        'email': emailController.text,
        'password': passwordController.text
      };
      userOnboardingController.updateemailandpass(
          emailController.text, passwordController.text);
      Map res = await ApiService().createUserAccount(data);
      if (res.isNotEmpty) {
        MySharedPref.setToken(res['token']);
        MySharedPref.setUserId(res['user_id'].toString());
        Get.offNamed(AppPages.TNC);
      }
      isLoading(false);
    }
  }

  void socialLogin() async {
    final credentials = await auth0
        .webAuthentication(
            scheme:
                "ehoa://dev-xaoieegxph0mwc8w.us.auth0.com/android/org.netgains.ehoa/callback")
        .login(useEphemeralSession: true);
    parseJwt(credentials.idToken);
  }

  parseJwt(String token) async {
    final parts = token.split('.');
    if (parts.length != 3) {
      debugPrint("invalid token");
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      debugPrint("invalid payload");
    }
    String email = payloadMap['email'];
    _socialLoginApiCall(email);
    Map<String, String> data = {'type': '1', 'email': email};
  }

  _socialLoginApiCall(String email) async {
    isLoading(true);
    Map<String, String> data = {'email': email};
    Map res = await ApiService().loginUser(data, isSocial: true);
    if (res.isNotEmpty) {
      MySharedPref.setToken(res['token']);
      MySharedPref.setUserId(res['data']['user_id'].toString());
      Map<String, dynamic> profileMap = await ApiService()
          .showProfile(id: (res['data']['user_id'].toString()));
      if (profileMap.isNotEmpty) {
        MyProfileResponse obj = MyProfileResponse.fromJson(profileMap);
        MySharedPref.setEmail(obj.showUser?.first.email ?? "");
        MySharedPref.setName(obj.showUser?.first.name ?? "");
        MySharedPref.setPeriodDay(obj.showUser?.first.periodDay ?? "");
        MySharedPref.setPeriodLen(
            parseInt(obj.showUser?.first.averageCycleDays.toString()));
        MySharedPref.setCycleLen(
            parseInt(obj.showUser?.first.averageCycleLength.toString()));
      }
      isLoading(false);

      Get.offAllNamed(AppPages.BASE);
    }
    isLoading(false);
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
