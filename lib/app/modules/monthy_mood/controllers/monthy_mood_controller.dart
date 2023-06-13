import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../service/base_controller.dart';

class MonthlyMoodController extends GetxController with BaseController {
  List<Mood> moodList = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    moodList
        .add(Mood(moodName: Strings.happy, moodId: 1, moodColor: 0xffFFEA2E));
    moodList
        .add(Mood(moodName: Strings.excited, moodId: 2, moodColor: 0xffB07BF3));
    moodList.add(Mood(moodName: Strings.sad, moodId: 3, moodColor: 0xffC4E8FC));
    moodList
        .add(Mood(moodName: Strings.scared, moodId: 4, moodColor: 0xff410082));
    moodList
        .add(Mood(moodName: Strings.tender, moodId: 5, moodColor: 0xff8DEE85));
    moodList
        .add(Mood(moodName: Strings.angry, moodId: 6, moodColor: 0xffFF5F1F));
    update();
  }
}

class Mood {
  Mood({this.moodName, this.moodId, this.moodColor});

  String? moodName;
  int? moodId;
  int? moodColor;
}
