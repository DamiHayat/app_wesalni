import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:first_project_flutter/core/services/services.dart';
import 'package:first_project_flutter/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}
class OnBoardingControllerImp extends OnBoardingController{
  int currentPage = 0;
  late PageController pageController;
  MyServices services = Get.find();
  @override
  next() {
    currentPage++;
    if(currentPage > onBoardingList.length - 1 ){
      services.sharedPreferences.setString("onboarding", "1") ;
      Get.offAllNamed(AppRoute.login);

    }else{
      pageController.animateToPage(currentPage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}