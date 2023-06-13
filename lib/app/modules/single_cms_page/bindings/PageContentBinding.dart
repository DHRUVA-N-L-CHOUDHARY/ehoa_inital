import 'package:ehoa/app/modules/single_cms_page/controllers/PageContentController.dart';
import 'package:get/get.dart';

class PageContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageContentController>(
      () => PageContentController(),
    );
  }
}
