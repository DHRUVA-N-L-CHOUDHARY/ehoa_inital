import 'package:ehoa/app/components/headings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZoomAnimation extends StatelessWidget {
  final String energy;
  final String assetcurt;
  final String energydescri;
  const ZoomAnimation({super.key,  this.energy = "", this.assetcurt= "",  this.energydescri = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: headingText(energy, fontSize: 28)),
          Container(
            height: 520.h,
            width: 520.h,
            child:  Center(
                  child: Image.asset(
                    assetcurt,
                    width: 520.h,
                    height: 520.h,
                  ),
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