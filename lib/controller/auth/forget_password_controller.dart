import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkPhone();
  goToVerifyCode();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkPhone() {
    throw UnimplementedError();
  }

  @override
  goToVerifyCode() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.verifyCode);
    }else{
      print("Not Valid");
    }
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}