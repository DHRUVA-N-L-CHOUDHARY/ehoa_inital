import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditAgeController extends GetxController with BaseController {
  List<int> list = List.empty(growable: true);
  RxString selectedAge = "2000".obs;

  @override
  void onInit() {
    super.onInit();
    getYearsList();
    selectedAge(Get.arguments.toString().isEmpty?"2000":Get.arguments);
    update();
  }

  void getYearsList() {
    int currYear = DateTime.now().year;
    int hundredYearsBack = currYear - 100;
    for (var i = 0; i < 100; i++) {
      list.add(hundredYearsBack);
      hundredYearsBack++;
    }
    list.add(currYear);
  }

  RxBool isLoading = false.obs;

  Future saveProfile() async {
    isLoading(true);
    Map<String, dynamic> data = {
      "dob": selectedAge.value,
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Get.back(result:selectedAge.value ),
    );
  }
}
