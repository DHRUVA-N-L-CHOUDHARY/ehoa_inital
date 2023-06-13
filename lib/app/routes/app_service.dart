import 'package:ehoa/main.dart';
import 'package:flutter/material.dart';

class AppService {
  final navigationKey = GlobalKey<NavigatorState>();

  static getContext() {
    return locator<AppService>().navigationKey.currentContext;
  }

  static isValidString(dynamic value) {
    return (value != null &&
        value.toString().trim().isNotEmpty &&
        value.toString().trim() != "null") ;
  }
}
