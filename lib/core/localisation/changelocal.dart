import 'dart:ui';

import 'package:first_project_flutter/core/constant/app_theme.dart';
import 'package:first_project_flutter/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeArabic;
  changeLang(String langcode){
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeFrensh;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }else if(sharedPrefLang == "fr") {
      language = const Locale("fr");
      appTheme = themeFrensh;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
      if(!(language == Locale("ar") || language == Locale("fr"))){
        language = const Locale("ar");
        appTheme = themeFrensh;
      }
    }
    super.onInit();
  }
}