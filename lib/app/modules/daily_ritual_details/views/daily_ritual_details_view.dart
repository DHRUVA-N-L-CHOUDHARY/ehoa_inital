import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/podcasts_detail/views/podcasts_detail_view.dart';
import 'package:ehoa/app/modules/view_pager/controllers/view_pager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../blog/views/blog_view.dart';
import '../../empower/controllers/empower_controller.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/daily_ritual_details_controller.dart';

class DailyRitualsDetailsView extends StatelessWidget {
  const DailyRitualsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyRitualsDetailsController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.empowerCtrl.changePage(EmpowerSelection.dailyRituals);
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
                headerImage: AppImages.dailyRitHeaderPng,
                heading: Strings.morningRitual,
                subHeading: Strings.empowerDailyRituals,
              ),
              c.tabs.isEmpty
                  ? Container()
                  : TabParent(selectedIndex: c.selectedTab, tabList: c.tabs),
              c.tabs.isEmpty ? Container() : getTabData(context, c),
              sizedBox(height: 180.h),
            ],
          ),
        ),
      );
    });
  }
}

Widget getTabData(BuildContext context, DailyRitualsDetailsController c) {
  switch (c.selectedTab) {
    case 1:
      return Column(
        children: List.generate(c.guideList.length, (index) {
          return PlayListCard(
            data: c.guideList[index],
            index: index,
            onTap: () {
              Get.toNamed(AppPages.PLAY_PODCAST);
            },
          );
        }),
      );
    case 0:
      return Column(
        children: List.generate(c.meditationList.length, (index) {
          return ArticleListCard(
            data: c.meditationList[index],
            index: index,
            onTap: () {
              Get.delete<ViewPagerController>();
              Get.toNamed(AppPages.VIEW_PAGER);
            },
          );
        }),
      );
    default:
      return Container();
  }
}
