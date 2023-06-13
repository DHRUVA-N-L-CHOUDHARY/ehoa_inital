import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/page_indicator.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../controllers/view_pager_controller.dart';

class ViewPagerView extends StatelessWidget {
  const ViewPagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewPagerController>(builder: (c) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      Get.back();
                      // c.empowerCtrl.changePage(EmpowerSelection.dailyRitDetails);
                    },
                    child: const Icon(
                      Icons.close,
                      color: LightThemeColors.white90,
                    ),
                  ),
                ),
              ]),
          body: Container());
    });
  }

  static Widget viewPagerSheet(b) {
    return GetBuilder<ViewPagerController>(builder: (c) {
      return WillPopScope(
        onWillPop: () async {
          Get.back();
          Get.back();
          //  c.empowerCtrl.changePage(EmpowerSelection.dailyRitDetails);
          return true;
        },
        child: Container(
          decoration: const BoxDecoration(
            color: LightThemeColors.backViewPagerColor,
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: c.pageList.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, left: 22.w, right: 22.w, bottom: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [],
                              ),
                              Row(
                                children:
                                    List.generate(c.pageList.length, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 7.w),
                                    child: PageIndicator(
                                      isTransparent: c.selectedPage != index,
                                    ),
                                  );
                                }),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                      Get.back();
                                      // c.empowerCtrl
                                      //     .changePage(EmpowerSelection.dailyRitDetails);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: LightThemeColors.white90,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(32.r),
                                    topLeft: Radius.circular(32.r))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      width: 75.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(23.r),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: PageView(
                                    controller: c.pageController,
                                    onPageChanged: (value) {
                                      c.selectedPage = value;
                                      c.update();
                                    },
                                    children: List.generate(c.pageList.length,
                                        (index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 22.w),
                                            child: c.pageList[index].title!.isEmpty ? Container() : headingText(
                                                c.pageList[index].title,
                                                color: LightThemeColors
                                                    .tabSelectedColor100),
                                          ),
                                          c.pageList[index].title!.isEmpty ? Container() : sizedBox(height: 16),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 22.w),
                                            child: discriptionText(
                                                c.pageList[index].description,
                                                color: LightThemeColors
                                                    .tabSelectedColor100),
                                          ),
                                          sizedBox(height: 10),
                                          Expanded(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                            child: c.pageList[index].image!
                                                    .isEmpty
                                                ? Container()
                                                : !c.pageList[index].image.toString().contains("assets/") ? FastCachedImage(
                                                  url: 
                                                    c.pageList[index].image!,
                                                    fit: BoxFit.cover,
                                                   gaplessPlayback: true, 
                                                   colorBlendMode: BlendMode.difference,
                                                  ) : Image.asset(
                                                    c.pageList[index].image!,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ))
                                        ],
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
        ),
      );
    });
  }

  static showSheet() {
    showFlexibleBottomSheet(
      initHeight: 0.99,
      isExpand: true,
      minHeight: 0,
      maxHeight: 1.0,

      //isCollapsible: true,
      isDismissible: false,
      isCollapsible: false,
      bottomSheetColor: Colors.transparent,
      context: AppService.getContext(),
      builder: (a, b, d) {
        return viewPagerSheet(b);
      },
      anchors: [0, 0.99, 1.0],
      isSafeArea: true,
    );
  }
}
