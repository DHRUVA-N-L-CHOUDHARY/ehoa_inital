import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';
import '../../../service/helper/dialog_helper.dart';

class EditPronounController extends GetxController with BaseController {
  List<DataList> pronouns = List.empty(growable: true);  
  TextEditingController pronounCtlr = TextEditingController();
  DataList? selectedPronoun;
  RxBool isLoading= false.obs;

   getPronounList() {
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.sheHer, itemId: "0"));
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.heHim, itemId: "1"));
    pronouns.add(DataList(
        isSelected: RxBool(false), itemName: Strings.theyThem, itemId: "2"));
    pronouns.add(
        DataList(isSelected: RxBool(false), itemName: Strings.la, itemId: "3"));

    String? selectedData =Get.arguments;
    if (selectedData!=null) {
      pronouns.forEach((element) {
        if (element.itemName == selectedData) {
          element.setIsSelected= true.obs;

          update();
        }
      });
      bool exist= false;
      pronouns.forEach((element) {
        if (selectedData == element.itemName) {
          exist = true;
        }

      });
      if (exist) {
        pronounCtlr.text = "";
      }  else{
        pronounCtlr.text = selectedData;

      }
    }

  }

  @override
  void onInit() {
    super.onInit();
    getPronounList();
    update();
  }


  Future saveProfile() async {
    if (selectedPronoun == null) {
      DialogHelper.showErrorDialog("Required", "Please select pronoun");
      return;
    }
    isLoading(true);
    Map<String, dynamic> data = {
       'custom_pronoun':selectedPronoun?.itemName,
      'pronoun_id':selectedPronoun?.itemId,
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
    Future.delayed(
      const Duration(milliseconds: 500),
          () => Get.back(result: selectedPronoun?.itemName),
    );
  }

}
