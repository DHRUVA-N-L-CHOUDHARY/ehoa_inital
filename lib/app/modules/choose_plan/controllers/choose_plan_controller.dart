import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';

class ChoosePlanController extends GetxController {

  List<Plan> plans = List.empty(growable: true);
  int selectedPlan = -1;

  @override
  void onInit() {
    super.onInit();
    getPlans();
  }

  void getPlans() {
    plans.add(Plan(
        amount: "\$8.23",
        info: Strings.perMonth.tr,
        discountText: null,
        isSelected: false,
        index: 0));

    plans.add(Plan(
        amount: "\$6.59",
        info: Strings.perMonthAnually.tr,
        discountText: "Save 20%",
        isSelected: false,
        index: 1));

    update();
  }
}

class Plan {
  Plan(
      {required this.amount,
      required this.info,
      this.discountText,
      this.isSelected = false,
      this.planId,
      this.index});

  String? amount;
  String? info;
  String? discountText;
  bool? isSelected;
  String? planId;
  int? index;
}
