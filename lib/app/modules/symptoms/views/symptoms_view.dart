import 'package:ehoa/app/components/app_bar.dart';
import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/common/app_utils.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/remote/api_interface.dart';
import 'package:ehoa/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../controllers/symptoms_controller.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SymptomsController>(builder: (c) {
      return baseBody(
        c.isLoading,
        SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(80.0), // here the desired height,
              child: MyAppBar(
                color: 0x0Dffffff,
                middle: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.h),
                    child: InkWell(
                      onTap: () {
                        c.selectDate();
                      },
                      child: Text(
                        DateFormat("dd, MMMM").format(c.date),
                        style: MyStyles.getTextStyle(
                            fontFamily: AppFonts.kInterRegular,
                            fontSize: 14,
                            color: LightThemeColors.white90),
                      ),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Padding(
                  padding:
                      MyPadding.getFixedHorizontalAndDynamicVerticalInsets(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBox(height: 38),

                      //Mentrual Flow
                      headingText(Strings.menstruralFlow),
                      sizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(c.menstrualFlow.length, (index) {
                            return ReportingCard(
                              data: c.menstrualFlow[index],
                              onTap: () {
                                c.menstrualFlow.forEach((element) {
                                  element.isSelected = false;
                                });
                                c.menstrualFlow[index].isSelected = true;
                                c.update();
                                //c.selectedGender = c.genders[index];
                                c.update();
                                // c.calVM.putLog(
                                //   CycleLog(
                                //     icon: AppIcons.flowLog,
                                //     name: "Flow",
                                //     type: CycleLogType.flow,
                                //   ),
                                // );
                              },
                            );
                          }),
                        ),
                      ),
                      sizedBox(height: 48),

                      //Symptomps
                      headingText(Strings.symptoms),
                      sizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(c.symptoms.length, (index) {
                            return ReportingCard(
                              data: c.symptoms[index],
                              onTap: () {
                                c.symptoms[index].isSelected =
                                    !c.symptoms[index].isSelected!;
                                c.update();
                              },
                            );
                          }),
                        ),
                      ),
                      sizedBox(height: 48),

                      //Emotions
                      headingText(Strings.emotions),
                      sizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(c.emotions.length, (index) {
                            return ReportingCard(
                              data: c.emotions[index],
                              onTap: () {
                                c.emotions.forEach((element) {
                                  element.isSelected = false;
                                });
                                c.emotions[index].isSelected = true;
                                c.update();
                                //c.selectedGender = c.genders[index];
                                c.update();
                                // c.calVM.putLog(
                                //   CycleLog(
                                //     icon: AppIcons.emotionLog,
                                //     name: "Emotion",
                                //     type: CycleLogType.emotion,
                                //   ),
                                // );
                              },
                            );
                          }),
                        ),
                      ),
                      sizedBox(height: 48),

                      //Energies
                      headingText(Strings.energies),
                      sizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(c.energy.length, (index) {
                            return ReportingCard(
                              data: c.energy[index],
                              onTap: () {
                                c.energy.forEach((element) {
                                  element.isSelected = false;
                                });
                                c.energy[index].isSelected = true;
                                c.update();
                                //c.selectedGender = c.genders[index];

                                c.update();
                                // c.calVM.putLog(
                                //   CycleLog(
                                //     icon: AppIcons.energyLog,
                                //     name: "Energy",
                                //     type: CycleLogType.energy,
                                //   ),
                                // );
                              },
                            );
                          }),
                        ),
                      ),
                      sizedBox(height: 28),
                      headingText(Strings.addToYourJournal),
                      sizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 5.h),
                        height: 120.h,
                        decoration: MyDecoration.getGlassDecoration(),
                        child: TextField(
                          controller: c.notesController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: Strings.enterNoteHere,
                              hintStyle: MyStyles.getTextStyle(
                                  color: LightThemeColors.white80,
                                  fontSize: 14)),
                          style: MyStyles.getTextStyle(
                              color: LightThemeColors.white90, fontSize: 15),
                          maxLines: null,
                        ),
                      ),
                      sizedBox(height: 40),
                      AppOutlineButton(
                          btnText: Strings.save,
                          ontap: () {
                            c.saveSymptoms();
                          }),
                      sizedBox(height: 100),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class ReportingCard extends StatelessWidget {
  const ReportingCard({
    required this.data,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Disorder data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: onTap,
            child: Container(
                width: 72.w,
                height: 72.h,
                decoration: data.isSelected!
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white)
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors
                            .transparent), //MyDecoration.getGlassDecoration(),
                child: Center(
                  child: FastCachedImage(
                      url: ApiInterface.imgPath + data.iconPath!,
                      gaplessPlayback: true,
                      fadeInDuration: Duration(milliseconds: 500)),
                )),
          ),
          sizedBox(height: 8),
          Text(
            data.name!,
            style: MyStyles.getTextStyle(
                fontFamily: AppFonts.kInterRegular, fontSize: 12),
          )
        ],
      ),
    );
  }
}
