import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/my_icon_button.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/modules/menu/views/menu_view.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../routes/app_service.dart';
import '../controllers/profile_controller.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (c) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.gradBkgPng)),
        ),
        child: Obx(() => baseBody(c.isLoading.value, Scaffold(
          appBar: MyAppBar(
            leading: [
              MyIconButton(
                  onTap: () {
                    Get.back();
                  },
                  isSvg: true,
                  icon: AppIcons.kBackArrowIcon),
            ],
            middle: [
              Text(
                Strings.profile,
                style: MyStyles.getTextStyle(
                    fontFamily: AppFonts.kInterRegular,
                    fontSize: 14,
                    color: LightThemeColors.white90),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox(height: 48),
                Padding(
                  padding:
                  MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: headingText(Strings.myCylce),
                ),
                sizedBox(height: 18),
                MyListTile(
                  keyName: Strings.avgCycleLen,
                  valueName: '${c.avgCycle.value} Days',
                  onTap: () {
                    showSheet(
                        heading: Strings.cycleLenHeading,
                        widget: getLengthScroller(
                            c.days, "average_cycle_length", c,
                            suffix: "Days"),
                        onTap: () async {
                          Get.back();
                          await c.saveProfile(
                              "average_cycle_length", c.selectCycle.value);
                        });
                  },
                ),
                MyListTile(
                  keyName: Strings.periodLen,
                  valueName: '${c.periodLength.value} Days',
                  onTap: () {
                    showSheet(
                        heading: Strings.periodLastsHeading,
                        widget: getLengthScroller(
                            c.days, "average_cycle_days", c,
                            suffix: "Days"),
                        onTap: () async {
                          Get.back();
                          await c.saveProfile(
                              "average_cycle_days", c.selectedPeriod.value);
                        });
                  },
                ),
                MyListTile(
                  keyName: Strings.periodStartDate,
                  valueName: c.getFormattedDay(),
                  onTap: () {
                    showSheet(
                        heading: Strings.periodStartDate,
                        widget:   SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) {
                              String date = DateFormat("yyyy-MM-dd").format(newDateTime);
                              c.selectedPeriodDate(date);
                              c.refresh();
                            },
                          ),
                        ),
                        onTap: () async{
                          Get.back();
                          await c.saveProfile(
                              "period_day", c.selectedPeriodDate.value);
                          c.refresh();
                        });
                  },
                ),
                /*  MyListTile(
                  keyName: Strings.ovulateOn,
                  valueName: c.ovulateOnDay.value,
                  onTap: () {
                    showSheet(
                        heading: Strings.ovulateOn,
                        widget: getLengthScroller(c.days,"", c, prefix: "Day"),
                        onTap: () {
                          Get.back();
                        });
                  },
                ),*/
                sizedBox(height: 50),
                Padding(
                  padding:
                  MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: headingText(Strings.myProfile),
                ),
                sizedBox(height: 18),
                MyListTile(
                  keyName: Strings.editProfileImg,
                  onTap: () {},
                ),
                MyListTile(
                  keyName: Strings.userName,
                  valueName: c.userName.value,
                  onTap: () async {
                   await Get.toNamed(AppPages.EDIT_NAME);
                    c.userName(MySharedPref.getName());
                  },
                ),
                MyListTile(
                  keyName: Strings.email,
                  valueName: c.email.value,
                  onTap: () {
                    Get.toNamed(AppPages.EDIT_EMAIL_START);
                  },
                ),
                MyListTile(
                  keyName: Strings.age,
                  valueName:'${ c.age.value}',
                  onTap: () async {
                 dynamic value= await  Get.toNamed(AppPages.EDIT_AGE, arguments: c.age.value.toString());
                 if (value!=null) {
                   c.age(value);
                   c.refresh();
                 }
                  },
                ),
                MyListTile(
                  keyName: Strings.weight,
                  valueName: '${c.weight.value} KG',
                  onTap: () async {
                 dynamic data =  await Get.toNamed(AppPages.EDIT_WEIGHT, arguments: c.weight.value );
                 if (data!=null) {
                   c.weight(data);
                 }
                  },
                ),
                MyListTile(
                  keyName: Strings.height,
                  valueName: '${c.height.value}M',
                  onTap: () async{
                    dynamic data =  await   Get.toNamed(AppPages.EDIT_HEIGHT, arguments: c.height.value);
                    if (data!=null) {
                      c.height(data);
                      c.update();
                    }
                  },
                ),
                MyListTile(
                  keyName: Strings.gender,
                  valueName: c.gender.value,
                  onTap: () async {
                  var data = await  Get.toNamed(AppPages.EDIT_GENDER, arguments: c.gender.value);
                  if (data!=null) {
                    c.gender(data);
                    c.update();
                  }
                  },
                ),
                MyListTile(
                  keyName: Strings.pronoun,
                  valueName: c.pronoun.value,
                  onTap: () async {
                    var data = await  Get.toNamed(AppPages.EDIT_PRONOUN, arguments: c.pronoun.value);
                    if (data!=null) {
                      c.pronoun(data);
                      c.update();
                    }
                  },
                ),
                MyListTile(
                  keyName: Strings.editPass,
                  onTap: () {
                     Get.toNamed(AppPages.EDIT_PASS);

                  },
                ),
              ],
            ),
          ),
        ))),
      );
    });
  }

  static showSheet({
    required String heading,
    required Widget widget,
    required VoidCallback onTap,
  }) {
    showFlexibleBottomSheet(
      initHeight: 0.40,
      isExpand: true,
      minHeight: 0.30,
      maxHeight: 0.45,
      //isCollapsible: true,
      isDismissible: false,
      isCollapsible: false,
      bottomSheetColor: Colors.transparent,
      context: AppService.getContext(),
      builder: (a, b, d) {
        return getSheet(
            heading: heading, child: widget, onTap: onTap, controller: b);
      },
      anchors: [0.30, 0.40, 0.45],
      isSafeArea: true,
    );
  }

  static Widget getSheet(
      {required String heading,
      required Widget child,
      required VoidCallback onTap,
      required ScrollController controller}) {
    return GetBuilder<ProfileController>(builder: (c) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            controller: controller,
            child: Container(
              decoration: const BoxDecoration(),
              padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SheetCloser(
                        color: 0xff0D172A,
                      ),
                    ],
                  ),
                  sizedBox(height: 10),
                  headingText(heading,
                      color: LightThemeColors.tabSelectedColor100),
                  sizedBox(height: 16),
                  child,
                ],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: AppOutlineButton(
                  btnText: Strings.save,
                  ontap: onTap,
                  color: 0xffFA6D6D,
                  isFilled: true,
                  filledTextColor: 0xffffffff,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  static Widget getLengthScroller(
      List<int> list, String key, ProfileController c,
      {prefix = "", suffix = ""}) {
    debugPrint("List len ${list.length}");
    return list.isEmpty
        ? Container()
        : SizedBox(
            //padding: EdgeInsets.only(bottom: 145.h, top: 50.h),
            height: 200.h,
            child: CupertinoPicker.builder(
              itemExtent: 45.0,
              useMagnifier: true,
              onSelectedItemChanged: (val) async {
                switch (key) {
                  case "average_cycle_length":
                    c.selectCycle = list[val].toString().obs;
                    break;
                  case "average_cycle_days":
                    c.selectedPeriod = list[val].toString().obs;
                    break;
                 case "period_start_date":
                    c.selectedPeriodDate = list[val].toString().obs;
                    break;
                }
              },
              childCount: list.length,
              diameterRatio: 5,
              // useMagnifier: true,
              selectionOverlay: Container(),
              scrollController: FixedExtentScrollController(
                  initialItem: list.indexWhere((element) {
                int? defaultDay = 28;
                switch (key) {
                  case "average_cycle_length":
                    if (c.avgCycle.isNotEmpty) {
                      defaultDay = int.tryParse(c.avgCycle.value);
                    }
                    break;
                  case "average_cycle_days":
                    if (c.periodLength.isNotEmpty) {
                      defaultDay = int.tryParse(c.periodLength.value);
                    }
                    break;
                }

                defaultDay = defaultDay ?? 28;
                return element == defaultDay;
              })),
              magnification: 1.3,
              itemBuilder: (context, index) {
                return Center(
                    child: Text(
                  "$prefix ${list[index].toString()} $suffix",
                  style: MyStyles.getTextStyle(
                      color: LightThemeColors.tabSelectedColor100,
                      fontFamily: AppFonts.kInterMedium,
                      fontSize: 12.8),
                ));
              },
            ),
          );
  }

  showEditPasswordDialog(){
    String oldPassWord ="";
    String newPassWord ="";
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Edit Pass",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'NO',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.amber,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'YES',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: Colors.amber,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}

class SheetCloser extends StatelessWidget {
  const SheetCloser({
    this.color,
    Key? key,
  }) : super(key: key);

  final int? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      width: 75.w,
      height: 4.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.r),
          color: Color(color ?? 0xffffffff)),
    );
  }
}
