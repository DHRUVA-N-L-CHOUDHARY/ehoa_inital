import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditHeightController extends GetxController with BaseController {
  List<int> mlist = List.empty(growable: true);
  List<int> cmlist = List.empty(growable: true);
  List<String> dotlist = List.empty(growable: true);
  List<String> mSymlist = List.empty(growable: true);

  int selectedMeter = 1;
  int selectedCM = 1;
  String selectedDot = ".";
  String selectedMSym = "m";

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setMeterList();
    setCentimeterList();
    setDotList();
    setMeterSymList();
    isLoading = false.obs;
    initData();
    update();
  }

  void setMeterList() {
    for (var i = 0; i < 4; i++) {
      mlist.add(i);
    }
    selectedMeter = 1;
  }

  void setCentimeterList() {
    for (var i = 0; i < 100; i++) {
      cmlist.add(i + 1);
    }
    selectedCM = 74;
  }

  void setDotList() {
    dotlist.add(".");
  }

  void setMeterSymList() {
    mSymlist.add("m");
  }
  Future saveProfile() async {
    isLoading(true);
    Map<String, dynamic> data = {
      "height": '$selectedMeter.$selectedCM',
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
    Future.delayed(
      const Duration(milliseconds: 500),
          () => Get.back(result: '$selectedMeter.$selectedCM'),
    );
  }
  void initData() {
    try {
      String? data = Get.arguments;
      if (data != null) {
        var v = data.split(".");
        selectedMeter = int.parse(v[0]);
        selectedCM = int.parse(v[1]);
        refresh();
      }
    } catch (e) {}

  }
}
