// ignore_for_file: must_be_immutable

import 'package:ehoa/app/components/app_outlined_btn.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/list_selection_tile.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:spring/spring.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/common/app_utils.dart';
import '../../../components/page_indicator.dart';
import '../../../components/utility_widgets.dart';
import '../../tnc/views/tnc_view.dart';
import '../controllers/cycle_len_controller.dart';

class CycleLenView extends StatelessWidget {
  const CycleLenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CycleLenController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImages.kCycleBkg)),
          ),
          child: Obx(() => baseBody(c.isLoading.value, Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                c.isAnimationCompleted
                    ? animatedUI(c,context)
                    : FadeInAnimation(
                  child: animatedUI(c,context),
                  animDuration: AppConstants.appUiAnimationDuration,
                  animStatus: (status) {
                    if (status == AnimStatus.completed) {
                      c.isAnimationCompleted = true;
                    }
                  },
                ),

              ],
            ),
            bottomNavigationBar: Padding(
              padding: MyPadding.getDynamicBottomPaddingWithFixedHorizontal(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListSelectionTile(
                    data: c.data,
                    onTap: () {
                      c.data.setIsSelected = RxBool(!c.data.getIsSelected!.value);
                      c.selected = c.data;
                      c.update();
                    },
                    padding: EdgeInsets.zero,
                  ),
                  AppOutlineButton(
                      btnText: Strings.next.tr,
                      ontap: () {
                        c.saveLength();

                      }),
                  sizedBox(height: 16),
                  Center(child: subHeadingText(Strings.updateInfo),),
                  sizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(
                        isTransparent: false,
                      ),
                      sizedBox(width: 8),
                      PageIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          ))));
    });
  }

  Container animatedUI(CycleLenController c, BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(
                      height: 30,
                    ),
                    backIcon(onTap: () {
                      Get.back();
                    }),
                    sizedBox(height: 35),
                    Center(
                      child: headingText(Strings.cycleLenHeading.tr),
                    ),
                    c.days.isEmpty
                        ? Container(
                            height: (MediaQuery.of(context).size.height / 2.25).h,
                          )
                        : Container(
                            padding:
                                EdgeInsets.only(bottom: 145.h, top: 50.h),
                            height: (MediaQuery.of(context).size.height / 2.25).h,
                            child: CupertinoPicker.builder(
                              itemExtent: 45.0,
                              onSelectedItemChanged: (val) {
                                c.selected = DataList(itemId: (val+1).toString(), itemName: (val+1).toString());
                                c.data= DataList(
                                    isSelected: RxBool(false), itemName: "I don't know", itemId: "0");
                                c.update();

                              },
                              childCount: c.days.length,
                              diameterRatio: 5,
                              // useMagnifier: true,
                              selectionOverlay: Container(),
                              scrollController: FixedExtentScrollController(
                                  initialItem: c.days.indexWhere((element) {
                                return element == 28;
                              })),
                              magnification: 1.3,
                              itemBuilder: (context, index) {
                                return Center(
                                    child: Text(
                                  "${c.days[index].toString()} Days",
                                  style: MyStyles.getTextStyle(
                                      color: LightThemeColors.white90,
                                      fontFamily: AppFonts.kInterMedium,
                                      fontSize: 12.8),
                                ));
                              },
                            ),
                          ),
                  ],
                ),
              );
  }
}
