// ignore_for_file: must_be_immutable


import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../utils/constants.dart';
import '../../../components/navbar/bottom_navbar.dart';
import '../controllers/base_controller.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControlller>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kGpBkg)),
          ),
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppPages.CALENDAR, //profileRoute,
                onGenerateRoute: c.onGenerateRoute,
              ),
              bottomNavigationBar: const BottomNavbar()
            )
            );
    });
  }
}
