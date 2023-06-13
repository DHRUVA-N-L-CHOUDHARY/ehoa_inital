import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/local/data_list_model.dart';
import '../../../routes/app_pages.dart';
import '../../empower/views/empower_view.dart';
import '../controllers/tips_controller.dart';

class TipsView extends StatelessWidget {
  const TipsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TipsController>(builder: (c) {
      return Navigator(
        key: Get.nestedKey(c.tipsNestedKey),
        initialRoute: AppPages.TIPS, //profileRoute,
        onGenerateRoute: c.onGenerateRoute,
      );
    });
  }
}

class TipsHomeView extends StatelessWidget {
  const TipsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TipsController>(builder: (c) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: subHeadingText(Strings.tips.tr),
            )),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              sizedBox(height: 16),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 22.w),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(c.energyTipsList.length, (index) {
                      return ListCard(
                          height: 163.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 8.w),
                          data: c.energyTipsList[index],
                          index: index,
                          onTap: () {
                            c.energy = DataList(
                              itemId: c.energyTipsList[index].itemId,
                              itemImageUrl: c.energyTipsList[index].itemImageUrl,
                              itemName: c.energyTipsList[index].itemName
                            );
                            c.changePage(TipSelection.eneryTip);
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
