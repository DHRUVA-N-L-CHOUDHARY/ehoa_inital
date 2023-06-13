import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../service/base_controller.dart';

class EditGenderController extends GetxController with BaseController {
  List<DataList> genders = List.empty(growable: true);
  TextEditingController genderCtlr = TextEditingController();
  DataList? selectedGender;
  RxBool isLoading= false.obs;
  getGenderList() {
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.female, itemId: "0"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.male, itemId: "1"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.takatapui, itemId: "2"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.nonBinary, itemId: "3"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.genderFluid, itemId: "4"));
    genders.add(DataList(
        isSelected: RxBool(false), itemName: Strings.interSex, itemId: "5"));

    String? selectedData =Get.arguments;
    if (selectedData!=null) {
      genders.forEach((element) {
        if (element.itemName == selectedData) {
          element.setIsSelected= true.obs;

          update();
        }
      });
      bool exist= false;
      genders.forEach((element) {
        if (selectedData == element.itemName) {
          exist = true;
        }

      });
      if (exist) {
        genderCtlr.text = "";
      }  else{
        genderCtlr.text = selectedData;

      }
    }
  }

  
  @override
  void onInit() {
    super.onInit();
    getGenderList();
    update();
  }
  Future saveProfile() async {
    if (selectedGender == null) {
      DialogHelper.showErrorDialog("Required", "Please select gender");
      return;
    }
    isLoading(true);
    Map<String, dynamic> data = {
      'gender':selectedGender?.itemName,
      'custom_gender':selectedGender?.itemName,
     /* 'custom_pronoun':selectedPronoun?.itemName,
      'pronoun_id':1,*/
    };
    Map<String, dynamic> res = await ApiService().updateProfile(data);
    isLoading(false);
    update();
    Future.delayed(
      const Duration(milliseconds: 500),
          () => Get.back(result: selectedGender?.itemName),
    );
  }

}
