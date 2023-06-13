import 'package:ehoa/app/modules/empower/views/empower_view.dart';
import 'package:ehoa/app/modules/tips/controllers/tips_controller.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/local/data_list_model.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../controllers/energy_tips_controller.dart';

class EnergyTipsView extends StatelessWidget {
  const EnergyTipsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnergyTipsController>(builder: (c) {
      return WillPopScope(
        onWillPop: () async {
          c.tipsCtrl.changePage(TipSelection.tips);
          return true;
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                c.tipsCtrl.changePage(TipSelection.tips);
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
                  headerImage: c.tipsCtrl.energy != null
                      ? c.tipsCtrl.energy!.itemImageUrl.toString()
                      : AppImages.energyTipHeaderPng,
                  heading: c.tipsCtrl.energy != null
                      ? c.tipsCtrl.energy!.itemName.toString()
                      : "",
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.h,
                            mainAxisSpacing: 16.w,
                            mainAxisExtent: 163.h,
                          ),
                          itemCount: c.energyList.length,
                          itemBuilder: (context, index) {
                            return ListCard(
                                height: 163,
                                width: 163,
                                data: c.energyList[index],
                                index: index,
                                onTap: () {
                                  c.subEnergy = DataList(
                                    itemId: c.energyList[index].itemId,
                                    itemImageUrl: c.energyList[index].itemImageUrl,
                                    itemName: c.energyList[index].itemName,
                                  );
                                  c.tipsCtrl
                                      .changePage(TipSelection.eneryTipDetails);
                                });
                          }),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
