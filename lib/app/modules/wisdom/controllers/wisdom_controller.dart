import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/modules/blog/controllers/blog_controller.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/apiModels/SubCatWisdomRes.dart';
import '../../../data/local/subcategory_id.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/base_controller.dart';

class WisdomController extends GetxController with BaseController {
  final empowerCtrl = Get.put(EmpowerController());
  List<DataList> wisdomFeatureList = List.empty(growable: true);

  @override
  void onReady() async {
    super.onReady();
    getWisdomFeatures();
    update();
  }

  Future<void> getWisdomFeatures() async {
    // isLoading(true);
    Map<String, dynamic> res =
        await ApiService().fetchSubCategories(SubCategoryId.getId);
    if (res.isNotEmpty) {
      SubCatWisdomModel subCategoryResponse = SubCatWisdomModel.fromJson(res);
      wisdomFeatureList.clear();
      subCategoryResponse.showSubCategory?.forEach((element) {
        wisdomFeatureList.add(DataList(
            itemId: element.categoryId.toString(),
            itemImageUrl: element.categoryImage.toString(),
            itemName: element.categoryName.toString(),
            onTap: getCategoryCallback(element)));
        // wisdomFeatureList[categories.length - 1].setImage =
        //     getCategoryImage(element);
        // wisdomFeatureList[categories.length - 1].setOnTap =
        //     getCategoryCallback(element);
      });

      update();
      //isLoading(false);
    }
  }

  VoidCallback getCategoryCallback(ShowSubCategory element) {
    if (element.categoryName!.toLowerCase().contains("blog")) {
      return () {
        // SubCategoryId.setId = element.categoryId.toString();
        //final c = Get.put(BlogController());
        BlogController.catId = element.categoryId.toString();
        //c.catId = element.categoryId.toString();
        // c.init();
        //c.update();
        empowerCtrl.changePage(EmpowerSelection.blog);
      };
    }
    if (element.categoryName!.toLowerCase().contains("maramataka")) {
      return () {
        Get.toNamed(AppPages.MOON_PHASES);
      };
    }
    if (element.categoryName!.toLowerCase().contains("moves")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("meditate")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("podcast")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("daily")) {
      return () {};
    }
    return () {};
  }
}
