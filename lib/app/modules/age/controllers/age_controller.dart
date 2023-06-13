import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:get/get.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/helper/dialog_helper.dart';

class AgeController extends GetxController {

   List<int> years = List.empty(growable: true);
   String selectedAge ="2000";
  bool isAnimationCompleted = false;
  RxBool isLoading = false.obs;
  final UserOnboardingController userOnboardingController = Get.find();

  Future saveDob() async {
    if (selectedAge.isEmpty) {
      DialogHelper.showErrorDialog("Required", "Please select year of birth");
      return;
    }
    isLoading(true);
    Map<String,dynamic>data = {
      'dob':selectedAge

    };
    userOnboardingController.updatedob(data['dob']);
    Map<String,dynamic> res = await ApiService().saveYear(data);
    isLoading(false);
    update();

    if (res.containsKey("token")) {
      Get.toNamed(AppPages.GENDER_N_PRONOUN);

    }
  }


  @override
  void onInit() {
    super.onInit();
    getYearsList();
    update();
  }

  void getYearsList() {
    int currYear = DateTime.now().year;
    int hundredYearsBack = currYear - 100;
    for (var i = 0; i < 100; i++) {
      years.add(hundredYearsBack);
      hundredYearsBack++;
    }
    years.add(currYear);
     
  }
}

