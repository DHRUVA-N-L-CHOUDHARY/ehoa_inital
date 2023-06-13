// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

// CustomAnimationBuilder<double> animation(
//     {required double begin,
//     required double end,
//     int seconds = 3,
//     EdgeInsets? padding,
//     required Widget? child}) {
//   return CustomAnimationBuilder<double>(
//       control: //!c.isAnimationCompleted
//           //?
//           Control.play,
//       //: Control.stop,
//       onStarted: () {},
//       onCompleted: () {
//         // c.isAnimationCompleted = true;
//       },
//       tween: Tween(begin: begin.h, end: end.h), // set tween
//       duration: Duration(seconds: seconds), // set duration
//       curve: Curves.easeInOut,
//       builder: (context, value, _) {
//         return Container(
//             padding: padding ?? const EdgeInsets.all(20),
//             width: value.h,
//             height: value.h,
//             child: SingleChildScrollView(child: child));
//       });
// }
