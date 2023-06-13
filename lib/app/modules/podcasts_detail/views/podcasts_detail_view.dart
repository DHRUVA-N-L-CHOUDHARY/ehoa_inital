import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:ehoa/app/data/local/play_list_model.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/config/theme/my_styles.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../empower/controllers/empower_controller.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/podcasts_detail_controller.dart';

class PodcastDetailsView extends StatelessWidget {
  const PodcastDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PodcastDetailsController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.empowerCtrl.changePage(EmpowerSelection.podcast);
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
                heading: Strings.podcasts + " Name",
                subHeading: Strings.podcasts,
              ),
              Column(
                children: List.generate(c.podcastsPlaylist.length, (index) {
                  return PlayListCard(
                    data: c.podcastsPlaylist[index],
                    index: index,
                    onTap: () {
                      Get.toNamed(AppPages.PLAY_PODCAST);
                    },
                  );
                }),
              )
            ],
          ),
        ),
      );
    });
  }
}

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    required this.data,
    required this.index,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final PlayListData data;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      padding: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
          color: LightThemeColors.white5,
          borderRadius: BorderRadius.circular(4.r)),
      child: Row(
        children: [
          Container(
            height: 59.h,
            width: 59.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: data.imageUrl!.isEmpty
                  ? Container()
                  : data.imageUrl!.contains("assets/") ? Image.asset(
                      data.imageUrl!,
                      fit: BoxFit.fill,
                    ):FastCachedImage(
                      url:
                      data.imageUrl!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.titleCategory!,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 8,
                        color: LightThemeColors.white80)),
                Text(data.title!,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterMedium,
                        fontSize: 14,
                        color: LightThemeColors.white80)),
                sizedBox(height: 10),
                Text(data.otherInfo!,
                    style: MyStyles.getTextStyle(
                        fontFamily: AppFonts.kInterRegular,
                        fontSize: 8,
                        color: LightThemeColors.white80)),
              ],
            ),
          )),
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: LightThemeColors.glassBkgColor,
              borderRadius: BorderRadius.circular(64.r),
              border: Border.all(color: LightThemeColors.glassStrokColor),
            ),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64.r),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(64.r),
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(64.r),
                  onTap: onTap,
                  child: const Center(
                      child: Icon(
                    Icons.play_arrow_rounded,
                    color: LightThemeColors.white90,
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArticleListCard extends StatelessWidget {
  const ArticleListCard({
    required this.data,
    required this.index,
    this.onTap,
    this.isNetwork = false,
    Key? key,
  }) : super(key: key);

  final PlayListData data;
  final int index;
  final VoidCallback? onTap;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      padding: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
          color: LightThemeColors.white5,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: LightThemeColors.glassStrokColor)),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Container(
                  height: 106.h,
                  width: 106.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: data.imageUrl!.isEmpty
                        ? Container()
                        : isNetwork
                            ? Image.network(
                                data.imageUrl!,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                data.imageUrl!,
                                fit: BoxFit.fill,
                              ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.titleCategory!,
                          style: MyStyles.getTextStyle(
                              fontFamily: AppFonts.kInterRegular,
                              fontSize: 8,
                              color: LightThemeColors.white80)),
                      Text(data.title!,
                          style: MyStyles.getTextStyle(
                              fontFamily: AppFonts.kInterMedium,
                              fontSize: 14,
                              color: LightThemeColors.white80)),
                      sizedBox(height: 10),
                      Text(data.otherInfo!,
                          style: MyStyles.getTextStyle(
                              fontFamily: AppFonts.kInterRegular,
                              fontSize: 12,
                              color: LightThemeColors.white80)),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
