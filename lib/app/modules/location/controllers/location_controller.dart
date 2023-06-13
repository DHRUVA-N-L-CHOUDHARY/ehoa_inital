import 'dart:convert';
import 'package:ehoa/app/data/apiModels/country_list_response.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:ehoa/app/service/user_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../data/apiModels/GroupListResponse.dart';
import '../../../data/local/data_list_model.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class LocationController extends GetxController {
  FocusNode? focusNode;
  bool? showDDOptions = false;
  List<DataList> list = List.empty(growable: true);
  DataList? selectedData;
  final UserOnboardingController userOnboardingController = Get.find();

  DataList iwiHapu = DataList(
      itemName: Strings.areYouAPartOf.tr,
      isSelected: RxBool(false),
      itemId: null);

  List<DataList> tribeList = List.empty(growable: true);
  List<DataList> tribeBaseList = List.empty(growable: true);

  TextEditingController iwiHapuCtrl = TextEditingController();

  DataList? selectedTribe;
  

  bool isAnimationCompleted = false;
  bool isCAnimationCompleted = false;
  bool isTAnimationCompleted = false;
  RxBool isLoading = false.obs;
  Future getCountries() async {
    isLoading(true);
    Map<String,dynamic> res = await ApiService().fetchLocations();
    Map<String,dynamic> groupsRes = await ApiService().showGroups();
    if (res.isNotEmpty) {
     CountryListResponse response = CountryListResponse.fromJson(res);
     response.showCountry?.country?.forEach((element) {
       list.add(DataList(itemName: element.countryName, itemImageUrl: "", isSelected: false.obs, itemId: element.countryId.toString()));

     });
    }
    if (groupsRes.isNotEmpty) {
      GroupListResponse gRes = GroupListResponse.fromJson(groupsRes);
      gRes.showGroups?.forEach((element) {

        tribeBaseList.add(DataList(
          itemName: element.groupName,
          itemId: element.gId.toString(),
          isSelected: RxBool(false),
        ));
      });
    }
    update();
    isLoading(false);
  }

  Future saveCountry() async {

    if (selectedData ==  null) {
      DialogHelper.showErrorDialog("Required", "Please select country");
    }
    if (iwiHapu.isSelected?.value == true) {
      if (selectedTribe == null) {
        DialogHelper.showErrorDialog("Required", Strings.pleeaseEnterIwiHapuName.tr);
      }
    }
     isLoading(true);
    Map<String,dynamic> data ={
      'country_id':selectedData?.itemId,
     };

    if (selectedTribe?.itemId!="-1") {
      data['group_id']=selectedTribe?.itemId??"";

    }else     if (iwiHapuCtrl.text.isNotEmpty) {
      data['community_name']=iwiHapuCtrl.text;
    }

userOnboardingController.updatecontry(data['country_id'], data['group_id']);
   Map<String,dynamic> res = await ApiService().saveCountry(data);
    if (res.isNotEmpty) {
    }
    update();
    isLoading(false);
    Get.toNamed(AppPages.NAME);

  }

  @override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    focusNode!.addListener(
      () {
        if (focusNode!.hasFocus) {
          showDDOptions = true;
          tribeList.clear();
          tribeList.addAll(tribeBaseList);
          update();
        } else {
          showDDOptions = false;
          update();
        }
      },
    );
    getCountries();
     update();
  }

  void search(String t) {
    tribeList.clear();
    for (var i = 0; i < tribeBaseList.length; i++) {
      if (tribeBaseList[i].itemName.toString().toLowerCase().contains(t.toLowerCase())) {
        tribeList.add(tribeBaseList[i]);
      }
    }
    addTypedOption();

    update();
  }

  addTypedOption() {
    tribeList.add(DataList(
        isSelected: RxBool(false),
        itemName: "Select typed name",
        itemId: "-1"));
  }
}
