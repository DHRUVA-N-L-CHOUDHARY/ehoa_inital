import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/modules/empower/views/empower_view.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../data/remote/api_interface.dart';
import '../../../routes/app_pages.dart';
import '../controllers/wisdom_controller.dart';

class WisdomView extends StatelessWidget {
  const WisdomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WisdomController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.empowerCtrl.changePage(0);
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: LightThemeColors.white90,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(
                headerImage: AppImages.wisdomHeaderPng,
                heading: Strings.empowerWisdom,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 22.w),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.h,
                          mainAxisSpacing: 16.w,
                          mainAxisExtent: 163.h,
                        ),
                        itemCount: c.wisdomFeatureList.length,
                        itemBuilder: (context, index) {
                          return ListCard(
                              height: 163,
                              width: 163,
                              data: c.wisdomFeatureList[index],
                              index: index,
                              onTap: c.wisdomFeatureList[index].onTap!,
                              // () {
                              //   if (index == 2) {
                              //     Get.toNamed(AppPages.MOON_PHASES);
                              //   } else if (index == 0 || index == 1) {
                               //   c.empowerCtrl.changePage(4);
                              //   }
                              // }
                              );
                        }),
                  )),
            ],
          ),
        ),
      );
    });
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    required this.headerImage,
    required this.heading,
    this.subHeading = "",
    Key? key,
  }) : super(key: key);

  final String headerImage;
  final String heading;
  final String? subHeading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 3.4).h,
          width: double.infinity,
          child: headerImage.contains("assets/")
              ? Image.asset(
                  headerImage,
                  fit: BoxFit.cover,
                )
              : FastCachedImage(
                  url: ApiInterface.imgPath + headerImage,
                  gaplessPlayback: true,
                  fadeInDuration: const Duration(milliseconds: 500),
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: (MediaQuery.of(context).size.height / 3.4).h,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.045),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              headingText(heading),
                              subHeadingText(subHeading!),
                            ],
                          ),
                        ))))),
      ],
    );
  }
}
