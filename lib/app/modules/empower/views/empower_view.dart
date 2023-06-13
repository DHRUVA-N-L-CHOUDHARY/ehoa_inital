// ignore_for_file: unused_import

import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/page_indicator.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../config/theme/my_fonts.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/empty_widget.dart';
import '../../../data/remote/api_interface.dart';
import '../../../routes/app_pages.dart';

class EmpowerView extends StatelessWidget {
  const EmpowerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmpowerController>(builder: (c) {
      return
          //Scaffold(
          //backgroundColor: Colors.transparent,
          //body:
          Navigator(
        key: Get.nestedKey(c.empowerNestedKey),
        initialRoute: AppPages.EMPOWER, //profileRoute,
        onGenerateRoute: c.onGenerateRoute,
      );
      //);
    });
  }
}

class EmpowerHomeView extends StatelessWidget {
  const EmpowerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmpowerController>(builder: (c) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height / 2.9).h,
                initialPage: 0,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                onPageChanged: (value) {
                  c.selectedIndicator = value;
                  c.update();
                },
                autoPlayInterval: 6000,
                isLoop: true,
                children:
                    // c.isLoading!
                    //     ? [const Center(child: Text("Images Loading"))]
                    //     : c.images.isNotEmpty
                    //         ? List.generate(c.images.length, (index) {
                    //             return AcademyList.getImageWidget(
                    //                 c.images[index].toString());
                    //           })
                    //         : [
                    //             Image.asset(
                    //               "assets/img/image_placeholder.jpg",
                    //               fit: BoxFit.cover,
                    //             )
                    //           ]
                    c.images.isEmpty
                        ? [const Center(child: Text("No images found"))]
                        : List.generate(c.images.length, (index) {
                            return Image.network(
                              c.images[index],
                              fit: BoxFit.cover,
                            );
                          })),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(c.images.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == c.images.length - 1 ? 0.h : 16.h),
                    child: PageIndicator(
                      width: 6,
                      height: 6,
                      isTransparent: c.selectedIndicator != index,
                      showCheck: false,
                    ),
                  );
                }),
              ),
            ),
            sizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText(Strings.empowerHomeHeading1),
                  subHeadingText(Strings.empowerHomeSubHeading),
                  sizedBox(height: 16),
                  Center(
                    child: Wrap(
                        spacing: 8.w,
                        direction: Axis.horizontal,
                        runSpacing: 8.w,
                        children: List.generate(c.categories.length, (index) {
                          return EmpowerCategoryCard(
                              iconPath: c.categories[index].getImage!,
                              text: c.categories[index].categoryName!,
                              onTap: c.categories[index].getOnTap);
                        })
                        //  [

                        //   EmpowerCategoryCard(
                        //     iconPath: AppImages.grouplpPng,
                        //     text: Strings.empowerMoonPhases,
                        //     onTap: () {
                        //       Get.toNamed(AppPages.MOON_PHASES);
                        //     },
                        //   ),
                        //   EmpowerCategoryCard(
                        //     iconPath: AppImages.groupgPng,
                        //     text: Strings.empowerMove,
                        //   ),
                        //   EmpowerCategoryCard(
                        //     iconPath: AppImages.grouprPng,
                        //     text: Strings.empowerMeditate,
                        //   ),
                        //   EmpowerCategoryCard(
                        //     iconPath: AppImages.groupoPng,
                        //     text: Strings.empowerMeditate,
                        //   ),
                        //   EmpowerCategoryCard(
                        //     iconPath: AppImages.groupyPng,
                        //     text: Strings.empowerDailyRituals,
                        //     onTap: () {
                        //       c.changePage(EmpowerSelection.dailyRituals);
                        //     },
                        //   ),
                        // ],
                        ),
                  )
                ],
              ),
            ),
            sizedBox(height: 12),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: headingText(Strings.empowerHomeHeading2),
            ),
            sizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(c.podcasts.length, (index) {
                  return ListCard(
                    data: c.podcasts[index],
                    index: index,
                    onTap: () {
                      c.showPodcast(c.podcasts[index]);
                      // c.changePage(EmpowerSelection.podcast);
                    },
                  );
                }),
              ),
            ),
            sizedBox(height: 36),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: headingText(Strings.empowerDailyRituals),
            ),
            sizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(c.dailyRituals.length, (index) {
                  return ListCard(
                    data: c.dailyRituals[index],
                    index: index,
                    onTap: () {
                      // c.changePage(EmpowerSelection.dailyRituals);
                    },
                  );
                }),
              ),
            ),
            sizedBox(height: 36),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: headingText(Strings.empowerWisdom),
            ),
            sizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(c.widoms.length, (index) {
                  return ListCard(
                    data: c.widoms[index],
                    index: index,
                    onTap: () {
                      //c.changePage(EmpowerSelection.wisdom);
                    },
                  );
                }),
              ),
            ),
            sizedBox(height: 100.h),
          ],
        ),
      );
    });
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    required this.data,
    required this.index,
    required this.onTap,
    this.width,
    this.height,
    this.margin,
    Key? key,
  }) : super(key: key);

  final DataList data;
  final int index;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? EdgeInsets.only(right: 0.w, left: index == 0 ? 24.w : 16.w),
      height: height?.h ?? 211.h,
      width: width?.w ?? 163.w,
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              height: height?.h ?? 211.h,
              width: width?.w ?? 163.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: data.itemImageUrl!.isNotEmpty
                    ? data.itemImageUrl!.contains("assets/")
                        ? Image.asset(data.itemImageUrl!)
                        : FastCachedImage(
                            url: ApiInterface.imgPath + data.itemImageUrl!,
                            gaplessPlayback: true,
                            fadeInDuration: const Duration(milliseconds: 500),
                            fit: BoxFit.fill,
                          )
                    : Container(),
              ),
            ),
            Positioned(
                child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
                  child: Text(
                    data.itemName!,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterSemibold, fontSize: 12),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}

class EmpowerCategoryCard extends StatelessWidget {
  const EmpowerCategoryCard({
    this.height,
    this.width,
    this.onTap,
    required this.iconPath,
    required this.text,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h ?? 56.h,
      width: width ?? MediaQuery.of(context).size.width / 2.4,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: Image.asset(iconPath),
            ),
            Positioned(
                // top: 20.h,
                // left: 20.w,
                child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  text,
                  style: MyStyles.getTextStyle(
                      fontFamily: AppFonts.kInterMedium,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
