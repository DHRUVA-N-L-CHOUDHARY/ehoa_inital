import 'package:ehoa/app/data/apiModels/CMSDetailResponse.dart';
import 'package:get/get.dart';

import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class PageContentController extends GetxController with BaseController {
  RxString title = "".obs;
  RxString description = "".obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getCmsData();
    super.onInit();
  }

  Future getCmsData() async {
    isLoading(true);
    print(Get.arguments.toString());
    print(Get.arguments.toString());
    print(Get.arguments.toString());
    print(Get.arguments.toString());
    Map<String, dynamic> cmsdata = await ApiService().showCmsSingle(Get.arguments.toString());
    if (cmsdata.isNotEmpty) {
      CMSDetailResponse res = CMSDetailResponse.fromJson(cmsdata);
      title(res.showPrivacySettings?.first.title);
      description(res.showPrivacySettings?.first.longDescription);
    }
    isLoading(false);
  }
}
