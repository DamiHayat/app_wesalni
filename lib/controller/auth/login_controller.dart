import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statut_request.dart';
import '../../core/functions/handlin_data_controller.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}
class LoginControllerImp extends LoginController{
  LoginData loginData  = LoginData(Get.find()) ;

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest ;

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await loginData.postdata(email.text , password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.rootPage);
         // Get.offNamed(AppRoute.);
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
    throw UnimplementedError();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
    throw UnimplementedError();
  }
}