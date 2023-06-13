import 'package:ehoa/app/components/page_indicator.dart';
import 'package:ehoa/app/components/sizedbox_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/light_theme_colors.dart';
import '../../config/theme/my_fonts.dart';
import '../../config/theme/my_styles.dart';
import '../../utils/constants.dart';
import '../data/local/data_list_model.dart';
import 'field_decorator.dart';

class ListSelectionTile extends StatelessWidget {
  const ListSelectionTile({required this.data, required this.onTap, this.padding, super.key});

  final DataList data;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding??EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          InkWell(
              onTap: onTap,
              child: FieldDecorator(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      data.itemName.toString(),
                      style: MyStyles.getTextStyle(
                          fontSize: MyFonts.textFieldOrContentSize,
                          fontFamily: AppFonts.kInterMedium,
                          color: LightThemeColors.white90),
                    )),
                    sizedBox(width: 16),
                    Obx(() => PageIndicator(
                        showCheck: true,
                        isTransparent: !data.getIsSelected!.value)),
                  ],
                ),
              )),
          sizedBox(height: 24)
        ],
      ),
    );
  }
}
