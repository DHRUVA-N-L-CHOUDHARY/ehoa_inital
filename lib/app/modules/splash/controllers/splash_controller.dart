import 'dart:convert';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import '../../../data/apiModels/MyProfileRes.dart';
import '../../../data/remote/api_service.dart';
import '../../login/controllers/login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SplashController extends GetxController {
  bool isAnimationCompleted = false;
  double beginY = 0, endY = -30;
  bool isLoading = true;
  Auth0 auth0 = Auth0(
      'dev-xaoieegxph0mwc8w.us.auth0.com', 'Jz6KIuNPDDiWnjbeZfoU7Ecojs7gkSwN');
  RxBool socialLoader = false.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  Future<void> navigate() async {
    String? token = MySharedPref.getToken();
    if (AppService.isValidString(token)) {
      Get.offAllNamed(AppPages.BASE);
    } else {
      isLoading = false;
      update();
    }
  }

  Future<UserCredential> facebooklogin() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  parseJwt(String token) async {
    final parts = token.split('.');
    if (parts.length != 3) {
      debugPrint("invalid token");
    }

    final payload = _decodeBase64(parts[1]);
    print("jdsklfdjskfjs");
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      debugPrint("invalid payload");
    }
    String email = payloadMap['email'];
    _socialLoginApiCall(email);
    Map<String, String> data = {'type': '1', 'email': email};
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

  _socialRegisterApiCall(String email, String name) async{

  }

  _socialLoginApiCall(String email) async {
    Map<String, String> data = {'email': email};
    Map res = await ApiService().loginUser(data, isSocial: true);
    socialLoader(false);

    if (res.isNotEmpty) {
      MySharedPref.setToken(res['token']);
      MySharedPref.setUserId(res['data']['user_id'].toString());
      print("dsjfldkfjdjflds");
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
        debugPrint(
            "<<< Period day ${MySharedPref.getPeriodDay()}, PeriodLen ${MySharedPref.getPeriodLen()} >>>");
      }
      socialLoader(false);
      Get.offAllNamed(AppPages.BASE);
    }
    socialLoader(false);
  }
}
