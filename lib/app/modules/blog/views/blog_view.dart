import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/modules/blog/controllers/blog_controller.dart';
import 'package:ehoa/app/modules/podcasts_detail/views/podcasts_detail_view.dart';
import 'package:ehoa/app/modules/view_pager/controllers/view_pager_controller.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../wisdom/views/wisdom_view.dart';

class BlogView extends StatelessWidget {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.empowerCtrl.changePage(1);
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
                headerImage: AppImages.blogHeaderPng,
                heading: Strings.modernMaramataka,
                subHeading: Strings.empowerWisdom,
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

Widget getTabData(BuildContext context, BlogController c) {
  switch (c.selectedTab) {
    case 0:
      return Column(
        children: List.generate(c.blogList.length, (index) {
          return ArticleListCard(
            data: c.blogList[index],
            index: index,
            isNetwork: true,
            onTap: () {
              c.showTips(index: index);
            },
          );
        }),
      );
    case 1:
      return Column(
        children: List.generate(c.podcasts.length, (index) {
          return PlayListCard(
            data: c.podcasts[index],
            index: index,
            onTap: () {
              c.showPodcast(c.podcasts[index]);
            },
          );
        }),
      );
    case 2:
      return Column(
        children: List.generate(c.videos.length, (index) {
          return PlayListCard(
            data: c.videos[index],
            index: index,
            onTap: () {
              Get.toNamed(AppPages.PLAY_PODCAST);
            },
          );
        }),
      );
    default:
      return Container();
  }
}

class TabParent extends StatelessWidget {
  const TabParent({
    required this.tabList,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  final List<Tabs> tabList;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: LightThemeColors.tabBarBkg,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
          children: List.generate(tabList.length, (index) {
        return Expanded(
          flex: 1,
          child: TabChild(
              tabData: tabList[index],
              index: index,
              selectedIndex: selectedIndex),
        );
      })),
    );
  }
}

class TabChild extends StatelessWidget {
  const TabChild({
    required this.tabData,
    required this.selectedIndex,
    required this.index,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Tabs tabData;
  final int selectedIndex;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: selectedIndex == tabData.index
            ? LightThemeColors.tabSelectedColor
            : Colors.transparent,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(4.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.r),
          onTap: tabData.onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                tabData.name,
                style: MyStyles.getTextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.kInterRegular,
                    color: LightThemeColors.white80),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
