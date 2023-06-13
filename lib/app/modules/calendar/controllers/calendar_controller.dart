import 'package:ehoa/app/data/apiModels/MyProfileRes.dart';
import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_service.dart';
import 'package:ehoa/app/modules/profile/controllers/profile_controller.dart';
import 'package:ehoa/config/theme/light_theme_colors.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../data/apiModels/TipsCategoryResponse.dart';
import '../../../service/base_controller.dart';
import '../../base/controllers/base_controller.dart';

class CalendarController extends GetxController with BaseController {
  final baseVM = Get.put(BaseControlller());
  int length = 3;
  List<double> values1 = [0.4, 0.8, 0.65, 0.75, 0.42, 0.83];
  List<double> values2 = [0.5, 0.3, 0.85, 0.65, 0.75, 0.42];
  List<CycleLog> logs = List.empty(growable: true);
  List<MoonData> moonList1 = List.empty(growable: true);
  List<MoonData> moonList2 = List.empty(growable: true);
  List<MoonData> moonList3 = List.empty(growable: true);
  List<EnergyInfo> energies = List.empty(growable: true);
  List<String> emotionLabels = List.empty(growable: true);
  

  String periodStartsIn = "";
  int periodLen = -1;
  String periodDay = "";
  String currCycleDay = "";
  String currCycleStartDate = "";
  String currCycleEndDate = "";
  int cycleLen = -1;
  bool showGraph = false;
  bool isLoading = true;
  RxString selectedPeriodDate = "".obs;
  RxString periodLength = "".obs;


  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future fetchUser() async {
    Map<String, dynamic> res =
        await ApiService().showProfile(id: MySharedPref.getUserId());
    if (res.isNotEmpty) {
      MyProfileResponse obj = MyProfileResponse.fromJson(res);
      selectedPeriodDate(obj.showUser?.first.periodDay.toString().validate());    
      periodLength(obj.showUser?.first.averageCycleDays.toString().validate());      
      update();
    }
  }

  List<String> getFormattedDay() {
    List<String> rtstr = [];
    try {
      if (selectedPeriodDate.isNotEmpty) {
        DateTime tempDate =
            DateFormat("yyyy-MM-dd").parse(selectedPeriodDate.value);
        String date = DateFormat("MMM dd").format(tempDate);
        rtstr.add(date);
         DateTime tempDate1 =
            DateFormat("yyyy-MM-dd").parse(periodLength.value);
        String peroidlendate = DateFormat("dd").format(tempDate);
        date = tempDate.add(Duration(days: int.parse(peroidlendate))).toString();
        rtstr.add(date);
        return rtstr;
      } else {
        DateTime tempDate =
            DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
        String date = DateFormat("MMM dd").format(tempDate);
        rtstr.add(date);
        rtstr.add(date);
        return rtstr;
      }
    } catch (e) {
       DateTime tempDate =
            DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
        String date = DateFormat("MMM dd").format(tempDate);
        rtstr.add(date);
        rtstr.add(date);
        return rtstr;
    }
  }

  Future<void> init() async {
    debugPrint(
        "<<< Period day ${MySharedPref.getPeriodDay()}, PeriodLen ${MySharedPref.getPeriodLen()} >>>");
    getPeriodStartsIn();
    debugPrint(periodStartsIn);
    fetchUser();
    await getEnergies();
    createCycles();
    await getLoggedSymptoms();
    getGraphData();
    isLoading = false;
    update();
  }

  createCycles() {
    DateTime firstDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    DateTime lastDate =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    createCycle(
        firstDate: firstDate,
        lastDate: lastDate,
        moonList: moonList1,
        isCurrent: true);

    DateTime pFirstDate =
        DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
    DateTime pLastDate = DateTime(DateTime.now().year, DateTime.now().month, 0);
    createCycle(
        firstDate: pFirstDate, lastDate: pLastDate, moonList: moonList2);


    DateTime ppFirstDate =
        DateTime(DateTime.now().year, DateTime.now().month - 2, 1);
    DateTime ppLastDate = DateTime(DateTime.now().year, DateTime.now().month-1, 0);
    createCycle(
        firstDate: ppFirstDate, lastDate: ppLastDate, moonList: moonList3);    
  }

  Future<void> getLoggedSymptoms() async {
    var data = {
      "user_id": MySharedPref.getUserId(),
      "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
    };
    debugPrint("show syms data $data");
    logs.clear();
    Map<String, dynamic> res = await ApiService().showSymptoms(data);
    if (res.isNotEmpty) {
      if (res["show_symptoms"] != null) {
        if (res["show_symptoms"]["symptoms"] != null) {
          List<dynamic> symps = res["show_symptoms"]["symptoms"] as List;
        }
        if (res["show_symptoms"]["menstrual_flow"] != null) {
          logs.add(CycleLog(
              icon: AppIcons.flowLog,
              type: CycleLogType.flow,
              name: res["show_symptoms"]["menstrual_flow"].toString()));
        }
        if (res["show_symptoms"]["emotions"] != null) {
          logs.add(CycleLog(
              icon: AppIcons.emotionLog,
              type: CycleLogType.emotion,
              name: res["show_symptoms"]["emotions"].toString()));
        }
        if (res["show_symptoms"]["energy"] != null) {
          logs.add(CycleLog(
              icon: AppIcons.energyLog,
              type: CycleLogType.energy,
              name: res["show_symptoms"]["energy"].toString()));
        }
        if (res["show_symptoms"]["journal"] != null) {
          logs.add(CycleLog(
              icon: AppIcons.noteLog,
              type: CycleLogType.notes,
              name: res["show_symptoms"]["journal"].toString()));
        }
      }
    }
    update();
  }

  putLog(CycleLog log) {
    logs.add(log);
    debugPrint("Logs len ${logs.length}");
    update();
  }

  void getPeriodStartsIn() {
    try {
      periodDay = MySharedPref.getPeriodDay() ?? "";
      periodLen = MySharedPref.getPeriodLen() ?? -1;
      cycleLen = MySharedPref.getCycleLen() ?? -1;
      DateTime periodDate =
          DateFormat("yyyy-MM-dd").parse(MySharedPref.getPeriodDay() ?? "");
      DateTime todayDate = DateTime.now();
      periodStartsIn = periodDate.difference(todayDate).inDays.toString();
      if(int.parse(periodStartsIn) < 0)
      {
        debugPrint(periodStartsIn);
        periodStartsIn = (int.parse(periodStartsIn) + 30).toString();
      }
      update();
    } catch (e) {
      debugPrint("Exception in getPeriodStartsIn() ${e.toString()}");
      periodStartsIn = "N/A";
    }
  }

  void createCycle(
      {DateTime? firstDate,
      DateTime? lastDate,
      List<MoonData> moonList = const [],
      bool? isCurrent = false}) {
    DateTime date = firstDate!;
    moonList.clear();
    while (lastDate!.difference(date).inDays != -1) {
      moonList.add(MoonData(
          color: EnergyLevelColors.none.value,
          date: date,
          energy: EnergyInfo(
              energyColor: EnergyLevelColors.none.value,
              energyId: "-1",
              energyType: EnergyType.nont,
              eneryName: "None"),
          icon: MoonData.getMoonIcon(date.day),
          isSelected: false));
      date = date.add(const Duration(days: 1));
    }
    if (isCurrent!) {
      try {
        DateTime startDate = DateFormat("yyyy-MM-dd").parse(periodDay);
        DateTime endDate = startDate.add(Duration(days: periodLen - 1));
        highlightPeriod(periodLen, startDate, endDate, moonList);
      } catch (e) {
        debugPrint("Exception -> unable to highlight ${e.toString()}");
      }
    }
    getSympsBetweenDates(
        convertToString(firstDate), convertToString(lastDate), moonList);
    update();
  }

  highlightPeriod(int periodLen, DateTime startDate, DateTime endDate,
      List<MoonData> moonList) {
    while (endDate.difference(startDate).inDays != -1) {
      String startDateStr = DateFormat("yyyy-MM-dd").format(startDate);
      int idx = moonList.indexWhere((element) {
        return DateFormat("yyyy-MM-dd").format(element.date!) == startDateStr;
      });
      if (idx != -1) {
        moonList[idx].isSelected = true;
      }
      startDate = startDate.add(const Duration(days: 1));
    }
  }

  Future getEnergies() async {
    Map<String, dynamic> res = await ApiService().fetchTipsCategory();
    if (res.isNotEmpty) {
      TipsCategoryResponse categoryResponse =
          TipsCategoryResponse.fromJson(res);
      energies.clear();
      categoryResponse.showDisorders?.forEach((element) {
        energies.add(EnergyInfo(
            energyId: element.disordersId.toString(),
            eneryName: element.name.toString(),
            energyColor: MoonData.getMoonColor(
                getEnergyType(element.name.toString().toLowerCase())),
            energyType: getEnergyType(element.name.toString().toLowerCase())));
      });
    }
  }

  static int getEnergyType(String name) {
    if (name.contains("very low")) {
      return EnergyType.veryLowEnergy;
    } else if (name.contains("low")) {
      return EnergyType.lowEnergy;
    } else if (name.contains("balanced")) {
      return EnergyType.balancedEnergy;
    } else if (name.contains("very high")) {
      return EnergyType.veryHighEnergy;
    } else if (name.contains("high")) {
      return EnergyType.highEnergy;
    } else {
      return EnergyType.nont;
    }
  }

  Future<void> getSympsBetweenDates(
      startDate, endDate, List<MoonData> moonList) async {
    var data = {
      "user_id": MySharedPref.getUserId(),
      "token": MySharedPref.getToken(),
      "start_date": startDate,
      "end_date": endDate
    };

    await ApiService().showSymptomsBetweenDates(data).then((res) {
      if (res.isNotEmpty) {
        //Save Data into List.
        if (res['show_symptoms'] != null) {
          List list = res['show_symptoms'] as List;
          for (int i = 0; i < list.length; i++) {
            List<CycleLog> logs = List.empty(growable: true);

            if (res["show_symptoms"][i]["menstrual_flow"] != null) {
              logs.add(CycleLog(
                  icon: AppIcons.flowLog,
                  type: CycleLogType.flow,
                  name: res["show_symptoms"][i]["menstrual_flow"].toString()));
            }
            if (res["show_symptoms"][i]["emotions"] != null) {
              logs.add(CycleLog(
                  icon: AppIcons.emotionLog,
                  type: CycleLogType.emotion,
                  name: res["show_symptoms"][i]["emotions"].toString()));
            }
            if (res["show_symptoms"][i]["energy"] != null) {
              logs.add(CycleLog(
                  icon: AppIcons.energyLog,
                  type: CycleLogType.energy,
                  name: res["show_symptoms"][i]["energy"].toString()));
            }
            if (res["show_symptoms"][i]["journal"] != null) {
              logs.add(CycleLog(
                  icon: AppIcons.noteLog,
                  type: CycleLogType.notes,
                  name: res["show_symptoms"][i]["journal"].toString()));
            }

            String energyId = list[i]["energy"].toString();
            EnergyInfo ei = CalendarController.getEnergyBy(energies, energyId);
            String d = list[i]["date"].toString();
            int idx = moonList.indexWhere((element) {
              return DateFormat("yyyy-MM-dd").format(element.date!) == d;
            });
            if (idx != -1) {
              moonList[idx].color = ei.energyColor;
              moonList[idx].energy = ei;
              moonList[idx].logList = logs;
            } else {
              moonList[idx].logList = logs;
            }
          }
        }
      }
      update();
    }).onError((error, stackTrace) {
      debugPrint("showSymptomsBetweenDates error => ${error.toString()}");
    });

    update();
  }

  static EnergyInfo getEnergyBy(List<EnergyInfo> energies, String energyId) {
    int idx = energies.indexWhere((element) {
      return energyId.toString() == element.energyId.toString();
    });
    if (idx != -1) {
      return energies[idx];
    } else {
      return EnergyInfo(
          energyColor: 0xff000000,
          energyId: "-1",
          eneryName: "None",
          energyType: EnergyType.nont);
    }
  }

  Future<void> getGraphData() async {
    values2.clear();
    await ApiService().fetchGraphValues(MySharedPref.getUserId()).then((res) {
      try {
        if (res.isNotEmpty) {
          debugPrint("show_curr_cycle_em $res");
          if (res["show_current_cycle_emotions"] != null) {
            Map<String, dynamic> map = res["show_current_cycle_emotions"];

            map.keys.forEach((element) {
              emotionLabels.add(element.toString());
            });

            map.values.forEach((element) {
              debugPrint("eleement $element");
              values2.add(double.parse(element["count"].toString()));
            });

            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Loving"]["count"]
            //     .toString()));
            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Empowered"]["count"]
            //     .toString()));
            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Positive"]["count"]
            //     .toString()));
            // // values2.add(double.parse(P
            // //     res["show_current_cycle_emotions"]["Calm"]["count"].toString()));
            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Exhausted"]["count"]
            //     .toString()));
            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Grateful"]["count"]
            //     .toString()));
            // values2.add(double.parse(res["show_current_cycle_emotions"]
            //         ["Energized"]["count"]
            //     .toString()));
          }
          showGraph = true;
        }
      } catch (e) {
        debugPrint("Exception in chart data ${e.toString()}");
      }
      update();
    }).onError((error, stackTrace) {
      debugPrint("Graph Error ${error.toString()}");
    });

    update();
  }
}

convertToString(DateTime date) {
  return DateFormat("yyyy-MM-dd").format(date);
}

class CycleLogType {
  static const emotion = 0;
  static const flow = 1;
  static const energy = 2;
  static const notes = 3;
  static const other = 4;
}

class CycleLog {
  CycleLog({this.icon, this.type, this.name, this.metaData});

  String? icon;
  int? type;
  String? name;
  Map? metaData;
}

class MoonData {
  MoonData(
      {this.icon,
      this.color,
      this.energy,
      this.isSelected = false,
      this.date,
      this.logList});

  String? icon;
  int? color;
  EnergyInfo? energy;
  bool? isSelected;
  DateTime? date;
  List<CycleLog>? logList = List.empty(growable: true);

  static int getMoonColor(int energy) {
    if (energy == EnergyType.veryLowEnergy) {
      return EnergyLevelColors.veryLowEnergy.value;
    } else if (energy == EnergyType.lowEnergy) {
      return EnergyLevelColors.lowEnergy.value;
    } else if (energy == EnergyType.balancedEnergy) {
      return EnergyLevelColors.balanceEnergy.value;
    } else if (energy == EnergyType.highEnergy) {
      return EnergyLevelColors.highEnergy.value;
    } else if (energy == EnergyType.veryHighEnergy) {
      return EnergyLevelColors.veryHighEnergy.value;
    } else if (energy == EnergyType.na) {
      return EnergyLevelColors.noEnergy.value;
    } else {
      return EnergyLevelColors.none.value;
    }
  }

  static String getMoonIcon(day) {
    return "assets/vectors/moons/Moon-$day.svg";
  }
}

class EnergyType {
  static const veryLowEnergy = 0;
  static const lowEnergy = 1;
  static const balancedEnergy = 2;
  static const highEnergy = 3;
  static const veryHighEnergy = 4;
  static const na = 5;
  static const nont = 6;
}

class EnergyInfo {
  String? eneryName;
  String? energyId;
  int? energyColor;
  int? energyType;

  EnergyInfo(
      {this.energyId, this.eneryName, this.energyColor, this.energyType});
}


// void getMoonsData2() {
  //   moonList2.clear();
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon11,
  //       isSelected: true));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon12,
  //       isSelected: true));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon13,
  //       isSelected: true));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.lowEnergy),
  //       energy: EnergyType.lowEnergy,
  //       icon: Moons.moon14,
  //       isSelected: true));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon15,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon16,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon17,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon18,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon19,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon20,
  //       isSelected: false));
  //   moonList2.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
  //       energy: EnergyType.veryLowEnergy,
  //       icon: Moons.moon21,
  //       isSelected: false));
  //   update();
  // }

  // void getMoonsData3() {
  //   moonList3.clear();
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon11,
  //       isSelected: true));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon12,
  //       isSelected: true));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon13,
  //       isSelected: true));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.lowEnergy),
  //       energy: EnergyType.lowEnergy,
  //       icon: Moons.moon14,
  //       isSelected: true));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon15,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.highEnergy),
  //       energy: EnergyType.highEnergy,
  //       icon: Moons.moon16,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon17,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon18,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon19,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.balancedEnergy),
  //       energy: EnergyType.balancedEnergy,
  //       icon: Moons.moon20,
  //       isSelected: false));
  //   moonList3.add(MoonData(
  //       color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
  //       energy: EnergyType.veryLowEnergy,
  //       icon: Moons.moon21,
  //       isSelected: false));
  //   update();
  // }
