import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/routes/app_pages.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnimWidget extends StatefulWidget {
  const AnimWidget({super.key});

  @override
  State<AnimWidget> createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget> {
  List<String> energylist = [
    "Very Low Energy",
    "Low Energy",
    "Medium Energy",
    "High Energy",
    "Very High Energy"
  ];
  List<String> energydescrilist = [
    "Feeling exhausted, depleted of\n all energy and low",
    "Feeling tired, unmotivated\n and low",
    "Feeling stable and ready \nto move ",
    "Feeling energised and \nmotivated",
    "Feeling Very energised\n productive and upbeat",
  ];
  double _volumeValue = 0;
  String energy = "";
  String energydescri = "";
  String assetcurt = AppImages.animinit;
  List<String> AssetList = [
    AppImages.animverylow,
    AppImages.animlow,
    AppImages.animmedi,
    AppImages.animhigh,
    AppImages.animveryhigh
  ];
  void onVolumeChanged(double value) {
    if (value > 0 && value <= 60) {
      value = 60;
      assetcurt = AssetList[0];
      energy = energylist[0];
      energydescri = energydescrilist[0];
    } else if (value > 60 && value <= 120) {
      value = 120;
      assetcurt = AssetList[1];
      energy = energylist[1];
      energydescri = energydescrilist[1];
    } else if (value > 120 && value <= 180) {
      value = 180;
      assetcurt = AssetList[2];
      energy = energylist[2];
      energydescri = energydescrilist[2];
    } else if (value > 180 && value <= 270) {
      value = 270;
      assetcurt = AssetList[3];
      energy = energylist[3];
      energydescri = energydescrilist[3];
    } else {
      value = 360;
      assetcurt = AssetList[4];
      energy = energylist[4];
      energydescri = energydescrilist[4];
    }
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Get.offNamed(AppPages.BASE);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: headingText(energy, fontSize: 28)),
          Container(
            height: 520.h,
            width: 520.h,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    assetcurt,
                    width: 520.h,
                    height: 520.h,
                  ),
                ),
                SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    onAxisTapped: onVolumeChanged,
                    minimum: 0,
                    maximum: 360,
                    startAngle: 270,
                    endAngle: 270,
                    useRangeColorForAxis: true,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 0.6,
                    axisLineStyle: AxisLineStyle(
                        cornerStyle: CornerStyle.bothFlat,
                        color: Colors.black12,
                        thickness: 100),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                            value: _volumeValue,
                            enableDragging: true,
                            onValueChanged: onVolumeChanged,
                            needleStartWidth: 0.5,
                            needleEndWidth: 0,
                            needleColor: Colors.transparent,
                            needleLength: 50,
                            knobStyle: KnobStyle(
                                color: Colors.black12,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                                knobRadius: 0.5)),
                      RangePointer(
                        enableDragging: true,
                        onValueChanged: onVolumeChanged,
                        value: _volumeValue,
                        cornerStyle: CornerStyle.bothFlat,
                        width: 300,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                        color: Colors.transparent,
                      ),
                    ],
                  )
                ]),
              ],
            ),
          ),
          AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 300.w,
              child: Center(
                  child: discriptionText(energydescri,
                      fontSize: 20, textAlign: TextAlign.center))),
        ],
      ),
    );
  }
}
