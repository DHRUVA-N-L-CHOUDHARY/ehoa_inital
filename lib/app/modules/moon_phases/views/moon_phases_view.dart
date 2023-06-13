import 'package:ehoa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/constants.dart';
import '../../../components/common/app_utils.dart';
import '../../podcasts_detail/views/podcasts_detail_view.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/moon_phases_controller.dart';

class MoonPhasesView extends StatelessWidget {
  const MoonPhasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoonPhasesController>(builder: (c) {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.gradBkgPng,
                  ),
                  fit: BoxFit.fill)),
          child: baseBody(
            c.isLoading.value,
            Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                    // c.tipsCtrl.changePage(TipSelection.eneryTip);
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
                      headerImage: AppImages.moonPhHeader,
                      heading: "Nga mata o te marama",
                      subHeading: "The phases of the moon",
                    ),
                    Column(
                      children: List.generate(c.list.length, (index) {
                        return ArticleListCard(
                          data: c.list[index],
                          index: index,
                          isNetwork: true,
                          onTap: () {
                            Get.toNamed(AppPages.MOON_PHASES_DETAILS);
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
