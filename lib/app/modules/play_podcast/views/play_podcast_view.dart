import 'package:blur/blur.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../controllers/play_podcast_controller.dart';

class PlayPodcastView extends StatelessWidget {
  const PlayPodcastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayPodcastController>(builder: (c) {
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

  static Widget playPodcastSheet(b) {
    return GetBuilder<PlayPodcastController>(builder: (c) {
      return WillPopScope(
        onWillPop: () async {
          Get.back();
          Get.back();
          return true;
        },
        child: Container(
          decoration: BoxDecoration(
              //  color: Colors.black,
              image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(AppImages.kGpBkg))
                  ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16.h, left: 22.w, right: 22.w, bottom: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: LightThemeColors.white90,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: 
                          c.podcastData!.thumbnail.toString().contains("/assets") ?
                          DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppImages.playPod))
                              : DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(c.podcastData!.thumbnail.toString())
                              ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32.r),
                              topLeft: Radius.circular(32.r))
                              ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 16.h),
                                width: 75.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23.r),
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 150.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          AppIcons.frameIcon,
                                          width: 32.w,
                                          height: 32.h,
                                        ),
                                        Blur(
                                          blur: 0.15,
                                          overlay: const Center(
                                              child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 85,
                                          )),
                                          borderRadius:
                                              BorderRadius.circular(500.r),
                                          child: Container(
                                            width: 110.w,
                                            height: 110.h,
                                            decoration: BoxDecoration(
                                              color: LightThemeColors.white50,
                                              borderRadius:
                                                  BorderRadius.circular(500.r),
                                            ),
                                            //child: Center(child: Icon(Icons.play_arrow_rounded, color: Colors.white,size: 85,)),
                                          ),
                                        ),
                                        Image.asset(
                                          AppIcons.frameIcon,
                                          width: 32.w,
                                          height: 32.h,
                                        ),
                                      ],
                                    ),
                                    sizedBox(height: 45.h),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 22.w),
                                          width: double.infinity,
                                          height: 2.h,
                                          color: Colors.white,
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 22.w, vertical: 16.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText(c.podcastData?.title??""),
                                  sizedBox(height: 10.h),
                                  discriptionText(c.podcastData?.description??"")
                                ],
                              ),
                            ),
                          ))
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
        return playPodcastSheet(b);
      },
      anchors: [0, 0.99, 1.0],
      isSafeArea: true,
    );
  }
}
