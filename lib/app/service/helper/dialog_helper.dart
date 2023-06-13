import 'package:ehoa/app/components/common/show_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:lottie/lottie.dart';

class DialogHelper {
  static get context => null;

  //show error dialog
  static void showErrorDialog(String title, String description,{bool isSuccess= false}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                style: Get.textTheme.headlineSmall,
              ),
              SizedBox(height: 10.h),
              Lottie.asset(
                isSuccess?'animations/success.json':'animations/apiError.json',
                height: 140.h,
                repeat: true,
                reverse: true,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.h),
              Text(
                description,
                style: Get.textTheme.bodyMedium,textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text(Strings.okay.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading() {
    Get.dialog(
      /*Center(
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: OverflowBox(
            minHeight: 130.h,
            maxHeight: 130.h,
            child: Lottie.asset(
              'animations/loader.json',
              height: 130.h,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),*/
      const ShowLoader()
    );
  }

  //hide loading
  static void hideLoading() {
    print("called");
    if (Get.isDialogOpen!) {
      Get.back();
   }
  }
}
