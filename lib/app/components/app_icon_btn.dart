import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onTap,
    this.padding,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget? icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(Get.context!).size.width / 2.3,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        onPressed: onTap,
        child: Padding(
            padding:
                padding ?? EdgeInsets.symmetric(vertical: 20.h, horizontal: 5),
            child: icon),
      ),
    );
  }
}
