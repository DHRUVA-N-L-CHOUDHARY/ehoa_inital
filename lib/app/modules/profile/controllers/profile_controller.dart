import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/apiModels/MyProfileRes.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';
import '../../login/controllers/login_controller.dart';

class ProfileController extends GetxController with BaseController {
  List<int> days = List.empty(growable: true);
  RxString selectCycle = "".obs;
  RxString selectedPeriod = "".obs;
  RxString selectedPeriodDate = "".obs;
  RxString avgCycle = "".obs;
  RxString periodLength = "".obs;
  RxString ovulateOnDay = "".obs;
  RxString userName = "".obs;
  RxString email = "".obs;
  RxString age = "".obs;
  RxString weight = "".obs;
  RxString height = "".obs;
  RxString gender = "".obs;
  RxString pronoun = "".obs;
  RxString ovulateDay = "".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDaysList();
    fetchUser();
    update();
  }

  void getDaysList() {
    for (var i = 0; i < 31; i++) {
      days.add(i + 1);
    }
  }

  Future fetchUser() async {
    Map<String, dynamic> res =
        await ApiService().showProfile(id: MySharedPref.getUserId());
    if (res.isNotEmpty) {
      MyProfileResponse obj = MyProfileResponse.fromJson(res);
      avgCycle(obj.showUser?.first.averageCycleLength.toString().validate());
      selectedPeriodDate(obj.showUser?.first.periodDay.toString().validate());
      periodLength(obj.showUser?.first.averageCycleDays.toString().validate());
      userName(obj.showUser?.first.name.toString().validate());
      email(obj.showUser?.first.email.toString().validate());
      age(obj.showUser?.first.dob.toString().validate());
      weight(obj.showUser?.first.weight.toString().validate());
      height(obj.showUser?.first.height.toString().validate());
      gender(obj.showUser?.first.customGender.toString().validate());
      pronoun(obj.showUser?.first.customPronoun.toString().validate());
      MySharedPref.setPeriodDay(obj.showUser?.first.periodDay ?? "");
          MySharedPref.setPeriodLen(
              parseInt(obj.showUser?.first.averageCycleDays.toString()));
      MySharedPref.setCycleLen(
              parseInt(obj.showUser?.first.averageCycleLength.toString()));              
      update();
    }
  }

  String getFormattedDay() {
    try {
      if (selectedPeriodDate.isNotEmpty) {
        DateTime tempDate =
            DateFormat("yyyy-MM-dd").parse(selectedPeriodDate.value);
        String date = DateFormat("dd MMM").format(tempDate);
        return date;
      } else {
        return "Select Start Date";
      }
    } catch (e) {
      return "Select Start Date";
    }
  }

  Future saveProfile(String key, String value) async {
    isLoading(true);
    Map<String, dynamic> data = {
      key: value,
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    await fetchUser();

    isLoading(false);

    update();
  }
}

extension StringChecker on String {
  String validate() {
    if (this == "null") {
      return "";
    } else {
      return this;
    }
  }
// ···
}
