import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../empower/views/empower_view.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/podcast_controller.dart';

class PodcastView extends StatelessWidget {
  const PodcastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PodcastController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.empowerCtrl.changePage(EmpowerSelection.empower);
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
                headerImage: AppImages.podcastHeaderPng,
                heading: Strings.podcasts,
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
                        itemCount: c.podcasts.length,
                        itemBuilder: (context, index) {
                          return ListCard(
                              height: 163,
                              width: 163,
                              data: c.podcasts[index],
                              index: index,
                              onTap: () {
                                c.empowerCtrl.changePage(EmpowerSelection.podcastDetails);
                              });
                        }),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
