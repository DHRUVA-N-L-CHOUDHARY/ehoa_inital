import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../service/base_controller.dart';
import '../../calendar/controllers/calendar_controller.dart';

class CycleDetailsController extends GetxController with BaseController {
  final calC = Get.put(CalendarController());
  List<MoonData> moonList2 = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    getMoonsData2();
    // getMoonsData3();
  }

  void getMoonsData2() {
    moonList2.clear();
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon0,
        isSelected: true));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon1,
        isSelected: true));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon2,
        isSelected: true));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon3,
        isSelected: true));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon4,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.highEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon5,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.lowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon6,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon7,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon8,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon9,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon10,
        isSelected: false));

    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon11,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon12,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon13,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon14,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.highEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon15,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.highEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon16,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon17,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon18,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.balancedEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon19,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon20,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon21,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.na),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon22,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.veryLowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon23,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.lowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon24,
        isSelected: false));
    moonList2.add(MoonData(
        color: MoonData.getMoonColor(EnergyType.lowEnergy),
        energy: EnergyInfo(energyType: EnergyType.veryLowEnergy),
        icon: Moons.moon25,
        isSelected: false));
    update();
  }
}
