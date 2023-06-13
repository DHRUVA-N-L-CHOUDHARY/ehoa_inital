import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/constants.dart';
import '../../../components/common/app_utils.dart';
import '../../energy_tips/controllers/energy_tips_controller.dart';
import '../../podcasts_detail/views/podcasts_detail_view.dart';
import '../../tips/controllers/tips_controller.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/energy_tips_details_controller.dart';

class EnergyTipsDetailsView extends StatelessWidget {
  const EnergyTipsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnergyTipsDetailsController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              c.tipsCtrl.changePage(TipSelection.eneryTip);
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: LightThemeColors.white90,
            ),
          ),
        ),
        body: baseBody( c.isLoading.value,SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(
                headerImage: c.enTipsCtl.subEnergy!.itemImageUrl.toString(),//AppImages.energyTipDetHeaderPng,
                heading: c.enTipsCtl.subEnergy!.itemName.toString(),
                subHeading: c.tipsCtrl.energy!.itemName,
              ),
              Column(
                children: List.generate(c.tipsArticlelist.length, (index) {
                  return ArticleListCard(
                    data: c.tipsArticlelist[index],
                    index: index,
                    isNetwork: true,
                    onTap: () {
                      c.showTips(tipsId:  c.tipsArticlelist[index].id.toString());
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ));
    });
  }
}
