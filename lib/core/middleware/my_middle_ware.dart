import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:first_project_flutter/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;

  MyServices myServices = Get.find() ;
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("onboarding") == "1"){
      return  RouteSettings(name: AppRoute.login) ;
    }
  }
}