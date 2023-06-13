import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../config/theme/my_styles.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_bar.dart';
import '../../../components/headings.dart';
import '../../../components/my_icon_button.dart';
import '../../../components/sizedbox_util.dart';
import '../controllers/calendar_list_view_controller.dart';

class CalendarListView extends StatelessWidget {
  const CalendarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarListViewController>(builder: (c) {
      return Scaffold(
          backgroundColor: LightThemeColors.backViewPagerColor,
          extendBodyBehindAppBar: true,
          appBar: MyAppBar(
            leading: [
              MyIconButton(
                icon: AppIcons.kBackArrowIcon,
                onTap: () {
                  Get.back();
                },
                isSvg: true,
                size: 16,
              )
            ],
          ),
          body: Stack(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 22.w,
                        // right: (MediaQuery.of(context).size.height * 0.0001).h,
                        top: 22.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              DateFormat("MMMM, yyyy").format(DateTime.now()),//'June, "Hune" 2022',
                              style: MyStyles.getTextStyle(
                                fontFamily: AppFonts.kInterMedium,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Pipiri',
                              style: MyStyles.getTextStyle(
                                fontFamily: AppFonts.kInterMedium,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: c.calC.moonList1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 80.w, right: 23.w, bottom: 16.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 16.w),
                      decoration: MyDecoration.getGlassDecoration(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    c.calC.moonList1[index].icon.toString(),
                                    color: Color(c.calC.moonList1[index].color!),
                                    width: 24.w,
                                    height: 25.h,
                                  ),
                                  sizedBox(width: 16),
                                  subHeadingText(DateFormat("dd, EEEE").format(c.calC.moonList1[index].date!), fontSize: 12),
                                ],
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    AppIcons.menuVertSvg,
                                    color: EnergyLevelColors.noEnergy,
                                    width: 24.w,
                                    height: 25.h,
                                  )),
                            ],
                          ),
                          sizedBox(height: 16),
                          headingText("Korekore-piri-ki-Tangaroa"),
                          sizedBox(height: 16),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              c.calC.moonList1[index].energy!.eneryName.toString(). toLowerCase() == "none" ? Container():  Container(
                                decoration: BoxDecoration(
                                    color: Color(c.calC.moonList1[index].color!),
                                    borderRadius: BorderRadius.circular(50.r)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 5.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.thunderSvg,
                                      color: Colors.white,
                                      width: 9.w,
                                      height: 9.h,
                                    ),
                                    sizedBox(width: 4),
                                    Text(
                                      c.calC.moonList1[index].energy!.eneryName.toString(),
                                      style: MyStyles.getTextStyle(
                                          fontSize: 8,
                                          fontFamily: AppFonts.kInterSemibold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              sizedBox(width: 23),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: List.generate(c.calC.moonList1[index].logList==null ? 0: c.calC.moonList1[index].logList!.length, (indexx) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 16.w),
                                      child: SvgPicture.asset(c.calC.moonList1[index].logList![indexx].icon!, width: 21.w,height: 21.h,),
                                    );
                                  })),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ));
    });
  }
}
