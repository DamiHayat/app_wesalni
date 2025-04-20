import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();

}
class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController repassword;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  resetPassword() {
    Get.offNamed(AppRoute.login);
    throw UnimplementedError();
  }

  @override
  goToSuccessResetPassword() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.checkEmail);
    }else{
      print("Not Valid");
    }
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
    throw UnimplementedError();
  }
}