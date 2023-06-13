import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/app/routes/app_service.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  double animationheight = 400.h;
  double animationwidth = 400.h;
  double _volumeValue = 0;
  Color needleColor = Color.fromARGB(255, 65, 0, 130);
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
  List<List<Color>> volumecolor = [
    [
      Color.fromARGB(255, 255, 95, 31),
      Color.fromARGB(230, 255, 95, 31),
      Color.fromARGB(230, 255, 95, 31),
      Color.fromARGB(50, 255, 95, 31),
      Color.fromARGB(0, 255, 95, 31),
    ],
    [
      Color.fromARGB(255, 255, 234, 46),
      Color.fromARGB(230, 255, 234, 46),
      Color.fromARGB(230, 255, 234, 46),
      Color.fromARGB(50, 255, 234, 46),
      Color.fromARGB(0, 255, 234, 46),
    ],
    [
      Color.fromARGB(255, 141, 238, 133),
      Color.fromARGB(230, 141, 238, 133),
      Color.fromARGB(230, 141, 238, 133),
      Color.fromARGB(50, 141, 238, 133),
      Color.fromARGB(0, 141, 238, 133),
    ],
    [
      Color.fromARGB(255, 176, 123, 243),
      Color.fromARGB(230, 176, 123, 243),
      Color.fromARGB(230, 176, 123, 243),
      Color.fromARGB(50, 176, 123, 243),
      Color.fromARGB(0, 176, 123, 243),
    ],
    [
      Color.fromARGB(255, 65, 0, 130),
      Color.fromARGB(255, 65, 0, 130),
      Color.fromARGB(255, 65, 0, 130),
      Color.fromARGB(200, 65, 0, 130),
      Color.fromARGB(0, 65, 0, 130),
    ],
  ];

  String energy = "";
  String energydescri = "";
  List<Color> _volumecolor = [];
  Color _linescolor = Colors.transparent;
Color _animcolor = Color.fromARGB(255, 65, 0, 130);
  void onVolumeChanged(double value) {
    if (value > 0 && value <= 60) {
      value = 60;
      needleColor = volumecolor[0][2];
      _volumecolor = volumecolor[0];
      energy = energylist[0];
      energydescri = energydescrilist[0];
       _linescolor = Colors.transparent;
       _animcolor = Colors.transparent;
    } else if (value > 60 && value <= 120) {
      value = 120;
      needleColor = volumecolor[1][2];
      _volumecolor = volumecolor[1];
      energy = energylist[1];
      energydescri = energydescrilist[1];
      _linescolor = Colors.white;
       _animcolor = Colors.transparent;
    } else if (value > 120 && value <= 180) {
      value = 180;
      needleColor = volumecolor[2][2];
      _volumecolor = volumecolor[2];
      energy = energylist[2];
      energydescri = energydescrilist[2];
      _linescolor = Colors.white;
       _animcolor = Colors.transparent;
    } else if (value > 180 && value <= 270) {
      value = 270;
      needleColor = volumecolor[3][2];
      _volumecolor = volumecolor[3];
      energy = energylist[3];
      energydescri = energydescrilist[3];
      _linescolor = Colors.white;
       _animcolor = Colors.transparent;
    } else {
      value = 360;
      needleColor = volumecolor[4][2];
      _volumecolor = volumecolor[4];
      energy = energylist[4];
      energydescri = energydescrilist[4];
      _linescolor = Colors.white;
       _animcolor = Colors.transparent;
    }

    setState(() {
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: MediaQuery.of(AppService.getContext()).size.height * 0.1,
          //  left: MediaQuery.of(AppService.getContext()).size.width*0.25,
          child: Center(child: headingText(energy, fontSize: 28)),
        ),
        Positioned(
          top: MediaQuery.of(AppService.getContext()).size.height * 0.15,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 520.h,
            height: 520.h,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color.fromARGB(255, 65, 0, 130),
                      // child:
                      gradient: _volumecolor.isNotEmpty
                          ? RadialGradient(colors: _volumecolor)
                          : null),
                  height: 520.h,
                  width: 520.h,
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AppImages.linesanim,
                      // AppImages.animinit,
                      color: _linescolor ,
                      width: 520.h,
                      height: 520.h,
                    ),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    AppImages.animinit,
                    color: _animcolor,
                    height: 480.h,
                    width: 480.h,
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    AppIcons.andesgn,
                    color: Color(0xFF0D172A),
                    colorBlendMode: BlendMode.hardLight,
                    height: 340.h,
                    width: 340.h,
                  ),
                ),
                ClipOval(
                  child: AnimatedContainer(
            duration: Duration(seconds: 1),
                    height: 100.h,
                    width: 100.h,
                    // decoration: ,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            AppImages.rectg,
                            height: 100.h,
                            width: 100.h,
                            color: Colors.white,
                            // colorBlendMode: BlendMode.hardLight,
                          ),
                        ),
                        Positioned(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 100.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50.h),
                                      bottomRight: Radius.circular(50.h)),
                                  gradient: LinearGradient(
                                      end: Alignment.topRight,
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(146, 146, 146, 1),
                                        Color.fromRGBO(13, 42, 23, 0.05)
                                      ]),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 100.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.h),
                                    bottomLeft: Radius.circular(50.h)),
                                gradient: LinearGradient(
                                    end: Alignment.topRight,
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(146, 146, 146, 1),
                                      Color.fromRGBO(13, 23, 42, 1)
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          needleColor: needleColor,
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
                        width: 70,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                        color: needleColor,
                        // gradient: SweepGradient(
                        //   colors: _volumecolor,
                        // ),
                      ),
                    ],
                  )
                ]),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(AppService.getContext()).size.height * 0.8,
          //  left: MediaQuery.of(AppService.getContext()).size.width*0.25,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
              width: 300.w,
              child: Center(
                  child: discriptionText(energydescri,
                      fontSize: 20, textAlign: TextAlign.center))),
        ),
      ],
    );
  }
}
