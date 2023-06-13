import 'package:ehoa/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';
import 'dart:math' as m;

class PeriodCalendarController extends GetxController with BaseController {
  final calC = Get.put(CalendarController());
  bool? isLoggingPeriod = false;
  DateTime? selectedDateTime = DateTime.now();
  DateTime? rangeStartDay;
  DateTime? rangeEndDay;

  String parseMonth(int month) {
    if (month == Month.january) {
      return "January";
    } else if (month == Month.february) {
      return "February";
    } else if (month == Month.march) {
      return "March";
    } else if (month == Month.april) {
      return "April";
    } else if (month == Month.may) {
      return "May";
    } else if (month == Month.june) {
      return "June";
    } else if (month == Month.july) {
      return "July";
    } else if (month == Month.august) {
      return "August";
    } else if (month == Month.september) {
      return "September";
    } else if (month == Month.october) {
      return "October";
    } else if (month == Month.november) {
      return "November";
    } else {
      return "December";
    }
  }

  String parseWeekDay(int weekday) {
    if (weekday == DateTime.sunday) {
      return "S";
    } else if (weekday == DateTime.monday) {
      return "M";
    } else if (weekday == DateTime.tuesday) {
      return "T";
    } else if (weekday == DateTime.wednesday) {
      return "W";
    } else if (weekday == DateTime.thursday) {
      return "T";
    } else if (weekday == DateTime.friday) {
      return "F";
    } else if (weekday == DateTime.saturday) {
      return "S";
    } else {
      return "";
    }
  }

  String getMoonByDay(int day) {
    int idx = calC.moonList1.indexWhere((element) {
      return element.date!.day == day;
    });

    if (idx != -1) {
      return calC.moonList1[idx].icon!;
    } else {
      return Moons.moon0;
    }

    // if (day == 1) {
    //   return Moons.moon0;
    // } else if (day == 2) {
    //   return Moons.moon1;
    // } else if (day == 3) {
    //   return Moons.moon2;
    // } else if (day == 4) {
    //   return Moons.moon3;
    // } else if (day == 5) {
    //   return Moons.moon4;
    // } else if (day == 6) {
    //   return Moons.moon5;
    // } else if (day == 7) {
    //   return Moons.moon6;
    // } else if (day == 8) {
    //   return Moons.moon7;
    // } else if (day == 9) {
    //   return Moons.moon8;
    // } else if (day == 10) {
    //   return Moons.moon9;
    // } else if (day == 11) {
    //   return Moons.moon10;
    // } else if (day == 12) {
    //   return Moons.moon11;
    // } else if (day == 13) {
    //   return Moons.moon12;
    // } else if (day == 14) {
    //   return Moons.moon13;
    // } else if (day == 15) {
    //   return Moons.moon14;
    // } else if (day == 16) {
    //   return Moons.moon15;
    // } else if (day == 17) {
    //   return Moons.moon16;
    // } else if (day == 18) {
    //   return Moons.moon17;
    // } else if (day == 19) {
    //   return Moons.moon18;
    // } else if (day == 20) {
    //   return Moons.moon19;
    // } else if (day == 21) {
    //   return Moons.moon20;
    // } else if (day == 22) {
    //   return Moons.moon21;
    // } else if (day == 23) {
    //   return Moons.moon22;
    // } else if (day == 24) {
    //   return Moons.moon23;
    // } else if (day == 25) {
    //   return Moons.moon24;
    // } else if (day == 26) {
    //   return Moons.moon25;
    // } else if (day == 27) {
    //   return Moons.moon20;
    // } else if (day == 28) {
    //   return Moons.moon20;
    // } else if (day == 29) {
    //   return Moons.moon20;
    // } else if (day == 30) {
    //   return Moons.moon20;
    // } else if (day == 31) {
    //   return Moons.moon20;
    // } else {
    //   return Moons.moon0;
    // }
  }

  int getEnergyColor(int day) {
    int idx = calC.moonList1.indexWhere((element) {
      return element.date!.day == day;
    });

    if (idx != -1) {
      return calC.moonList1[idx].energy!.energyColor!;
    } else {
      return 0xff000000;
    }
    // int energy = m.Random().nextInt(6);
    // if (day == 1) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 2) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 3) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 4) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 5) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 6) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 7) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 8) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 9) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 10) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 11) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 12) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 13) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 14) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 15) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 16) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 17) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 18) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 19) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 20) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 21) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 22) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 23) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 24) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 25) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 26) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 27) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 28) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 29) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 30) {
    //   return MoonData.getMoonColor(energy);
    // } else if (day == 31) {
    //   return MoonData.getMoonColor(energy);
    // } else {
    //   return MoonData.getMoonColor(energy);
    // }
  }

  getSelected(int day) {
    try {
      int idx = calC.moonList1.indexWhere((element) {
        return element.date!.day == day;
      });

      if (idx != -1) {
        return calC.moonList1[idx].isSelected;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Exception in getSelected Unable to find selection");
    }
  }

  getIsToday(int day) {
    return DateTime.now().day == day;
  }
}

class Month {
  static const january = 1;
  static const february = 2;
  static const march = 3;
  static const april = 4;
  static const may = 5;
  static const june = 6;
  static const july = 7;
  static const august = 8;
  static const september = 9;
  static const october = 10;
  static const november = 11;
  static const december = 12;
}
