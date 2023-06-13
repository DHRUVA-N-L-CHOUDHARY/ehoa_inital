import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/app_bar.dart';
import '../../../components/app_outlined_btn.dart';
import '../../../components/my_icon_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/period_calendar_controller.dart';

class PeriodCalendarView extends StatelessWidget {
  const PeriodCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeriodCalendarController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppImages.gradBkgPng),
            fit: BoxFit.fill,
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
                preferredSize:
                    const Size.fromHeight(80.0), // here the desired height
                child: MyAppBar(
                  color: 0x00000000,
                  leading: [
                    MyIconButton(
                        onTap: () {
                          Get.back();
                        },
                        isSvg: true,
                        icon: AppIcons.kBackArrowIcon)
                  ],
                  middle: [
                    headingText(DateFormat("MMMM")
                            .format(DateTime.now()) //'June "Hune"',
                        )
                  ],
                )),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    1, // adjust the height here
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  rowHeight: 90.h,
                  daysOfWeekHeight: 70,
                  rangeSelectionMode: c.isLoggingPeriod!
                      ? RangeSelectionMode.toggledOn
                      : RangeSelectionMode.toggledOff,
                  firstDay: DateTime.now(),
                  focusedDay: c.selectedDateTime!,
                  lastDay: DateTime(2100),
                  headerVisible: true,
                  rangeEndDay: c.rangeEndDay,
                  rangeStartDay: c.rangeStartDay,
                  onRangeSelected: (start, end, focusedDay) {
                    c.rangeEndDay = end;
                    c.rangeStartDay = start;
                    c.update();
                  },
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, day) {
                      return Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [subHeadingText(c.parseMonth(day.month))],
                          ));
                    },
                    dowBuilder: (context, day) {
                      return Center(
                          child: subHeadingText(c.parseWeekDay(day.weekday),
                              fontSize: 12));
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isSelected: c.getSelected(day.day),
                        isToday: c.getIsToday(day.day),
                      );
                    },
                    selectedBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isSelected: true,
                        isToday: c.getIsToday(day.day),
                      );
                    },
                    disabledBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isToday: false,
                      );
                    },
                    outsideBuilder: (context, day, focusedDay) {
                      return Container();
                    },
                    todayBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isToday: true,
                        isSelected: false,
                      );
                    },

                    //Range
                    rangeStartBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isSelected: true,
                      );
                    },
                    rangeEndBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isSelected: true,
                      );
                    },
                    withinRangeBuilder: (context, day, focusedDay) {
                      return CalendarCell(
                        day: day.day,
                        c: c,
                        isSelected: true,
                      );
                    },
                    rangeHighlightBuilder: (context, day, isWithinRange) {
                      return Container();
                    },
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronIcon: SvgPicture.asset(
                      AppIcons.kBackArrowIcon,
                      width: 16.w,
                      height: 16.h,
                    ),
                    rightChevronIcon: SvgPicture.asset(
                      AppIcons.kRightArrowIcon,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  currentDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(c.selectedDateTime, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) async {
                    debugPrint("selectedDay $selectedDay");
                    //c.selectedDateTime = selectedDay;
                    // c.update();
                    if (!c.isLoggingPeriod!) {
                      Get.toNamed(AppPages.CALENDAR_LIST_VIEW);
                    }
                  },
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: MyPadding.getFixedHorizontalAndDynamicVerticalInsets(
                  vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppOutlineButton(
                            btnText: "Close",
                            isFilled: false,
                            fontSize: 10,
                            ontap: () {
                              Get.back();
                            }),
                      ),
                      sizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: AppOutlineButton(
                            btnText: "Edit period dates",
                            fontSize: 10,
                            ontap: () {
                              Get.toNamed(AppPages.PROFILE);
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

class CalendarCell extends StatelessWidget {
  const CalendarCell({
    required this.day,
    required this.c,
    this.isSelected = false,
    this.isToday = false,
    super.key,
  });

  final bool? isSelected;
  final bool? isToday;
  final int day;
  final PeriodCalendarController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isSelected! ? 8.h : 0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: isSelected!
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: EnergyLevelColors.veryLowEnergy.withOpacity(0.3))
            : null,
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              c.getMoonByDay(day),
              width: 24.w,
              height: 24.h,
              color: Color(c.getEnergyColor(day)),
            ),
            sizedBox(height: 7.5.h),
            Text(
              day.toString(),
              style: MyStyles.getTextStyle(
                  fontFamily: AppFonts.kInterRegular,
                  fontSize: 10,
                  color: LightThemeColors.white90),
            ),
            isToday!
                ? const Text(
                    "•",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
