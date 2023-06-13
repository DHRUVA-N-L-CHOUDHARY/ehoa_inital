// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

class MySharedPref {
  

  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _userId = "userId";
  static const String _token = "token";
  static const String _refToken = "refToken";
  static const String _name = "_name";
  static const String _email = "email";
  static const String _image = "image";
  static const String _language = "lang";
  static const String _periodLen = "periodLen";
  static const String _periodDay = "periodDay";
  static const String _cycleLen = "cycleLen";

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// set theme current type as light theme
  static void setName(String name) => _sharedPreferences.setString(_name, name);

  static String getName() => _sharedPreferences.getString(_name) ?? "";

  static void setLang(String lang) =>
      _sharedPreferences.setString(_language, lang);

  static String getLang() => _sharedPreferences.getString(_language) ?? "";

  /// set theme current type as light theme
  static void setEmail(String email) =>
      _sharedPreferences.setString(_email, email);

  static String getEmail() => _sharedPreferences.getString(_email) ?? "";

  /// set theme current type as light theme
  static void setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;

  /// save current locale
  static void setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _sharedPreferences.getString(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated fcm token
  static void setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  //Userid getter setter
  static void setUserId(String userId) =>
      _sharedPreferences.setString(_userId, userId);

  static String? getUserId() => _sharedPreferences.getString(_userId);

  //Token getter setter
  static void setToken(String accessToken) =>
      _sharedPreferences.setString(_token, accessToken);

  static String? getToken() => _sharedPreferences.getString(_token);

  //Refresh Token getter setter
  static void setRefreshToken(String refToken) =>
      _sharedPreferences.setString(_refToken, refToken);

  static String? getRefreshToken() => _sharedPreferences.getString(_refToken);

  static void setPeriodDay(String periodDay) =>
      _sharedPreferences.setString(_periodDay, periodDay);

  static String? getPeriodDay() => _sharedPreferences.getString(_periodDay);

  static void setPeriodLen(int periodLen) =>
      _sharedPreferences.setInt(_periodLen, periodLen);

  static int? getPeriodLen() => _sharedPreferences.getInt(_periodLen);

  static void setCycleLen(int cycleLen) =>
      _sharedPreferences.setInt(_cycleLen, cycleLen);

  static int? getCycleLen() => _sharedPreferences.getInt(_cycleLen);

  static void clearSession() {
    _sharedPreferences.clear();
  }
}
