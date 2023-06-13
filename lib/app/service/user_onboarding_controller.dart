import 'package:ehoa/app/data/models/user_onboarding_model.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:get/get.dart';

class UserOnboardingController extends GetxController {
  Useronboardingmodel? user = Useronboardingmodel();
  RxBool isLoading = false.obs;

  void updateemailandpass(String email, String password) {
    user?.email = email;
    user?.password = password;
  }

  void updateisterm(String is_term, String is_understand) {
    user?.is_term = is_term;
    user?.is_understand = is_understand;
  }

  void updatecontry(String country, String group_id) {
    user?.country_id = country;
    user?.group_id = group_id;
  }

  void updatename(String name) {
    user?.name = name;
  }

  void updatedob(String dob) {
    user?.dob = dob;
  }

  void updategenderpronoun(String gender, String pronoun_id,
      String custom_gender, String custom_pronoun) {
    user?.gender = gender;
    user?.pronoun_id = pronoun_id;
    user?.custom_gender = custom_gender;
    user?.custom_pronoun = custom_pronoun;
  }

  void updatefocusid(String focus_id) {
    user?.focus_id = focus_id;
  }

  void updateavgcyclelen(String average_cycle_length) {
    user?.average_cycle_length = average_cycle_length;
  }

  void updateavgcycledays(String average_cycle_days) {
    user?.average_cycle_days = average_cycle_days;
  }

  void updatelang(String language_id) {
    user?.language_id = language_id;
  }

  void updateusernotificationsts(String user_notification_status) {
    user?.user_notification_status = user_notification_status;
  }

  Future<void> registeraccount() async {
    isLoading(true);
    Map<String, dynamic> data = {
      'email':user?.email,
      'password':user?.password,
      'is_term':user?.is_term,
      'is_understand':user?.is_understand,
      'country_id':user?.country_id,
      'group_id':user?.group_id,
      'dob':user?.dob,
      'gender': user?.gender,
      'pronoun_id':user?.pronoun_id,
      'custom_gender':user?.custom_gender,
      'custom_pronoun':user?.custom_pronoun,
      'focus_id':user?.focus_id,
      'average_cycle_length':user?.average_cycle_length,
      'average_cycle_days':user?.average_cycle_days,
      'language_id':user?.language_id,
      'user_notification_status':user?.user_notification_status
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
  }
}
