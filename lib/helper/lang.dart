import 'package:ashtar/utility/app_fonts.dart';

import '../lang/ar.dart';
import '../lang/en.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utility/app_setting.dart';

extension T on String {
  String get trans {
    String? word = tr;
    //  if (word != null) {
    return word;
    // } else {
    //   return 'none';
    // }
  }
}

class Lang extends Translations {
  static Future<Locale> getDefaultOrStoredLocal() async {
    var _appLocale = const Locale('ar'); //set defualt
    var prefs = await SharedPreferences
        .getInstance(); //create instance from SharedPreferences
    if (prefs.getString('language_code') == null) {
      await prefs.setString('language_code', 'ar'); //store defalut
      globalLang = _appLocale.toString(); //set globalLang
      isArabic = true; //set isArabic
      return _appLocale; //return default
    } else {
      _appLocale = Locale(prefs.getString('language_code')!); //get stored
      globalLang = _appLocale.toString(); //set globalLang
      isArabic = globalLang == "ar" ? true : false; //set isArabic
      return _appLocale; //return stored
    }
  }

  static changeLang(Locale locale) async {
    var prefs = await SharedPreferences.getInstance();
    var _appLocale = await getDefaultOrStoredLocal();
    if (_appLocale == locale) {
      return;
    }
    if (locale == Locale("ar")) {
      Get.updateLocale(locale);
      _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      globalLang = _appLocale.toString();
      isArabic = true;
      await prefs.setString('countryCode', '');
    } else {
      Get.updateLocale(locale);
      _appLocale = Locale("en");
      globalLang = _appLocale.toString();
      isArabic = false;
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    AppFonts.mainfont = isArabic ? "Tajawal" : "Poppins";
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', ''),
  ];
}
