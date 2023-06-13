import 'dart:convert';

import 'package:ehoa/app/components/app_icon_btn.dart';
import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/splash/controllers/splash_controller.dart';
import 'package:ehoa/app/modules/tnc/views/tnc_view.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/main.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:spring/spring.dart';
import 'package:http/http.dart' as http;

import '../../../../config/translations/strings_enum.dart';
import '../../../components/sizedbox_util.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // late String token;
  // getToken() async {
  //   token = await FirebaseMessaging.instance.getToken() ?? "";
  //   print(
  //       "-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=->$token");
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   var initializationSettingsAndroid =
  //       const AndroidInitializationSettings('ic_launcher');
  //   var initialzationSettingsAndroid =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var initializationSettings =
  //       InitializationSettings(android: initialzationSettingsAndroid);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings);

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       final http.Response response =
  //           await http.get(Uri.parse(android.imageUrl ?? ""));
  //       BigPictureStyleInformation bigPictureStyleInformation =
  //           BigPictureStyleInformation(ByteArrayAndroidBitmap.fromBase64String(
  //               base64Encode(response.bodyBytes)));

  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //                 channel.id, channel.name, channel.description,
  //                 color: Colors.blue,
  //                 icon: "@mipmap/ic_launcher",
  //                 importance: Importance.high,
  //                 priority: Priority.high,
  //                 styleInformation: bigPictureStyleInformation),
  //           ),
  //           payload: android.imageUrl);
  //     }
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       showDialog(
  //           // context: context,
  //           builder: (_) {
  //             return AlertDialog(
  //               title: Text(notification.title ?? ""),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [Text(notification.body ?? "")],
  //                 ),
  //               ),
  //             );
  //           },
  //           context: context);
  //     }
  //   });

  //   getToken();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(Gifs.kSplashGif)),
        ),
        child: Obx(() => baseBody(
            c.socialLoader.value,
            Scaffold(
              backgroundColor: Colors.transparent,
              body: c.isLoading
                  ? Container()
                  : Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Center(
                            child: Lottie.asset(
                              'animations/splashlogo.json',
                              height: 140.h,
                              repeat: false,
                              reverse: false,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: c.isAnimationCompleted
                                ? _getLoginUi(c)
                                : SlideUpAnimation(
                                    child: _getLoginUi(c),
                                    animStatus: (status) {
                                      if (status == AnimStatus.completed) {
                                        c.isAnimationCompleted = true;
                                      }
                                    },
                                  ))
                        //animation(begin: 0, end: 250, child: _getLoginUi(c))) //)
                      ],
                    ),
            ))),
      );
    });
  }

  Widget _getLoginUi(SplashController c) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          children: [
            AppOutlineButton(
              btnText: Strings.contWithEmail.tr,
              ontap: () {
                Get.toNamed(AppPages.CREATE_ACC);
                //Get.toNamed(AppPages.BASE);
              },
              isFilled: false,
            ),
            sizedBox(
              height: 14,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(
                  Icons.apple,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                onPressed: () {
                  c.signInWithApple().then((value) {
                        Map<String, dynamic> data = {
                          "email": value.user?.email,
                          "password": value.user?.uid.replaceRange(8, value.user?.uid.length, ''),
                        };
                        ApiService()
                            .createUserAccount(data)
                            .then((value1) => Get.offNamed(AppPages.TNC));
                      });
                },
                label: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(Strings.signInWithApple.tr,
                        style: MyStyles.getTextStyle(
                            fontSize: 16.0,
                            fontFamily: AppFonts.kInterMedium,
                            color: Colors.black))),
              ),
            ),
            sizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AppIconButton(
                    icon: const Icon(
                      Ionicons.logo_google,
                      color: Colors.red,
                    ),
                    onTap: () {
                      c.signInWithGoogle().then((value) {
                        Map<String, dynamic> data = {
                          "email": value.user?.email,
                          "password": value.user?.uid.replaceRange(8, value.user?.uid.length, '')
                        };
                        ApiService()
                            .createUserAccount(data)
                            .then((value1) => Get.offNamed(AppPages.TNC));
                      });
                    },
                    padding: const EdgeInsets.all(13.0),
                  ),
                ),
                sizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppIconButton(
                    icon: const Icon(Icons.facebook),
                    onTap: () {
                      c.facebooklogin().then((value) {
                        Map<String, dynamic> data = {
                          "email": value.user?.email,
                          "password": value.user?.uid.replaceRange(8, value.user?.uid.length, '')
                        };
                        ApiService()
                            .createUserAccount(data)
                            .then((value1) => Get.offNamed(AppPages.TNC));
                      });
                    },
                    padding: const EdgeInsets.all(13.0),
                  ),
                ),
              ],
            ),
            sizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.LOGIN);
              },
              child: Text(Strings.loginAsk.tr,
                  style: MyStyles.getTextStyle(
                      fontSize: 14.0, fontFamily: AppFonts.kInterSemibold)),
            ),
            sizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
