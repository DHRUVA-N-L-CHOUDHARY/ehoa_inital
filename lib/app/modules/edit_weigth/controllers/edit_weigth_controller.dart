import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditWidthController extends GetxController with BaseController {
  List<int> kglist = List.empty(growable: true);
  List<int> gmlist = List.empty(growable: true);
  List<String> dotlist = List.empty(growable: true);
  List<String> kgSymlist = List.empty(growable: true);

  int selectedKg = 75;
  int selectedGm = 5;
  String selectedDot = ".";
  String selectedMSym = "kg";

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setKgList();
    setGmList();
    setDotList();
    setKgSymList();
    initData();
    isLoading = false.obs;
    update();
  }

  void setKgList() {
    for (var i = 1; i <= 100; i++) {
      kglist.add(i);
    }
    selectedKg = 75;
  }

  void setGmList() {
    for (var i = 0; i < 10; i++) {
      gmlist.add(i + 1);
    }
    selectedGm = 5;
  }

  void setDotList() {
    dotlist.add(".");
  }

  void setKgSymList() {
    kgSymlist.add("kg");
  }

  Future saveProfile() async {
    isLoading(true);
    Map<String, dynamic> data = {
      "weight": '$selectedKg.$selectedGm',
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Get.back(result: '$selectedKg.$selectedGm'),
    );
  }

  void initData() {
    try {
      String? data = Get.arguments;
      if (data != null) {
        var v = data.split(".");
        selectedKg = int.parse(v[0]);
        selectedGm = int.parse(v[1]);
        print('$selectedGm $selectedKg');
        refresh();
      }
    } catch (e) {}

  }
}
