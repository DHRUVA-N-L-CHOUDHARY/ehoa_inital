import 'dart:convert';

import 'package:ehoa/app/components/common/constant_data.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../service/base_controller.dart';

class SymptomsController extends GetxController with BaseController {
  final calVM = Get.put(CalendarController());
  List<Disorder> menstrualFlow = List.empty();
  List<Disorder> symptoms = List.empty();
  List<Disorder> emotions = List.empty();
  List<Disorder> energy = List.empty();
  bool isLoading = false;

  int selectedMensFlowIndex = -1;
  int selectedEnergyIndex = -1;
  int selectedEmotionIndex = -1;

  DateTime date = DateTime.now();

  TextEditingController notesController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    menstrualFlow = List.empty();
    symptoms = List.empty();
    emotions = List.empty();
    energy = List.empty();
    isLoading = false;

    selectedMensFlowIndex = -1;
    selectedEnergyIndex = -1;
    selectedEmotionIndex = -1;

    menstrualFlow = fetchDisordersById(APP_MENSTRUAL_FLOW);
    update();

    symptoms = fetchDisordersById(APP_SYMPTOMS);
    update();

    emotions = fetchDisordersById(APP_EMOTIONS);
    update();

    energy = fetchDisordersById(APP_ENERGY);
    update();

    refresh();
    getLoggedSymptoms();
  }

  selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        context: AppService.getContext());

    if (pickedDate != null) {
      date = pickedDate;
      init();
    } else {}
    update();
  }

  Future<void> getLoggedSymptoms() async {
    var data = {
      "user_id": MySharedPref.getUserId(),
      "date": DateFormat("yyyy-MM-dd").format(date),
    };
    debugPrint("show syms data $data");
    Map<String, dynamic> res = await ApiService().showSymptoms(data);
    if (res.isNotEmpty) {
      if (res["show_symptoms"] != null) {
        if (res["show_symptoms"]["symptoms"] != null) {
          List<dynamic> symps = res["show_symptoms"]["symptoms"] as List;
          for (int i = 0; i < symps.length; i++) {
            int symIdx = symptoms.indexWhere((element) {
              return element.disorderId.toString() == symps[i].toString();
            });
            if (symIdx != -1) {
              symptoms[symIdx].isSelected = true;
            }
          }
        }
        if (res["show_symptoms"]["menstrual_flow"] != null) {
          String flowId = res["show_symptoms"]["menstrual_flow"].toString();
          int fId = menstrualFlow.indexWhere((element) {
            return element.disorderId.toString() == flowId;
          });
          if (fId != -1) {
            menstrualFlow[fId].isSelected = true;
          }
        }
        if (res["show_symptoms"]["emotions"] != null) {
          String emoId = res["show_symptoms"]["emotions"].toString();
          int emoIdx = emotions.indexWhere((element) {
            return element.disorderId.toString() == emoId;
          });
          if (emoIdx != -1) {
            emotions[emoIdx].isSelected = true;
          }
        }
        if (res["show_symptoms"]["energy"] != null) {
          String enId = res["show_symptoms"]["energy"].toString();
          int enIdx = energy.indexWhere((element) {
            return element.disorderId.toString() == enId;
          });
          if (enIdx != -1) {
            energy[enIdx].isSelected = true;
          }
        }
        if (res["show_symptoms"]["journal"] != null) {
          notesController.text = res["show_symptoms"]["journal"];
        }
      }
    }
    update();
  }

  fetchDisordersById(
    String data, {
    String? id,
  }) {
/*
    Map res = await ApiService().fetchDisorder(id: id);
*/
    Map res = jsonDecode(data);
    List<Disorder> list = List.empty(growable: true);
    if (res.isNotEmpty) {
      List dis = res["show_disorders"] as List;
      for (var i = 0; i < dis.length; i++) {
        list.add(Disorder(
            index: i,
            disorderId: dis[i]["disorders_id"],
            disorderType: dis[i]["disorders_type"],
            name: dis[i]["name"],
            iconPath: dis[i]["icon"],
            primary: dis[i]["primary"],
            status: dis[i]["status"],
            createdAt: dis[i]["created_at"],
            updatedAt: dis[i]["updated_at"],
            isSelected: false));
      }
      return list;
    }
    return list;
  }

  Future<void> saveSymptoms() async {
    //78 => very low
    //

    isLoading = true;
    update();
    dynamic flowId, energyId, emotionsId;
    List<String> symptomsArr = List.empty(growable: true);

    int fIdx = menstrualFlow.indexWhere((element) {
      return element.isSelected == true;
    });
    if (fIdx != -1) {
      flowId = menstrualFlow[fIdx].disorderId.toString();
    }

    int enIdx = energy.indexWhere((element) {
      return element.isSelected == true;
    });
    if (enIdx != -1) {
      energyId = energy[enIdx].disorderId.toString();
    }

    int emoIdx = emotions.indexWhere((element) {
      return element.isSelected == true;
    });
    if (emoIdx != -1) {
      emotionsId = emotions[emoIdx].disorderId.toString();
    }

    for (int i = 0; i < symptoms.length; i++) {
      if (symptoms[i].isSelected!) {
        symptomsArr.add(symptoms[i].disorderId.toString());
      }
    }
    var data = {
      "user_id": MySharedPref.getUserId(),
      "token": MySharedPref.getToken(),
      "menstrual_flow": flowId,
      "symptoms": symptomsArr,
      "energy": energyId,
      "emotions": emotionsId,
      "journal": notesController.text.trim(),
      "date": DateFormat("yyyy-MM-dd").format(date)
    };
    debugPrint("save symp data $data");

    Map<String, dynamic> res = await ApiService().saveSymptoms(data);
    isLoading = false;
    update();
    if (res.isNotEmpty) {
      Get.snackbar("Res", res.toString());
    }
  }
}

class DisorderIds {
  static const mesturalFlow = "1";
  static const symptoms = "2";
  static const emotions = "3";
  static const energies = "4";
}

class Disorder {
  Disorder({
    this.index,
    this.disorderId,
    this.disorderType,
    this.name,
    this.iconPath,
    this.primary,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isSelected = false,
  });

  int? index;
  int? disorderId;
  int? disorderType;
  String? name;
  String? iconPath;
  String? primary;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? isSelected;
}
