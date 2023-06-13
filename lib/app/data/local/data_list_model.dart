import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DataList {
  String? itemName = "";
  RxBool? isSelected = false.obs;

  String? itemId = "";
  String? itemImageUrl = "";
  VoidCallback? onTap;
  Map<String, dynamic>? map;

  DataList(
      {this.itemName,
      this.isSelected,
      this.itemId,
      this.itemImageUrl,
      this.onTap,
      this.map
      });

  RxBool? get getIsSelected => isSelected;
  set setIsSelected(RxBool? isSelected) => this.isSelected = isSelected;
}
