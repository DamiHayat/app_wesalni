import 'package:first_project_flutter/controller/auth/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/validinputs.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/custom_text_form_auth.dart';
import '../../widget/auth/text_sign_up.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text('21'.tr, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17))
      ),
      body:
      WillPopScope(
        onWillPop: AlertExitApp,
        child:

              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    CustomTextTitleAuth(text: "11".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "12".tr),
                    const SizedBox(height: 75),
                    CustomTextFormAuth(
                      hintText: '21'.tr,
                      labelText: '22'.tr,

                      iconData: Icons.person_outline,
                      mycontroller: controller.username,
                      valid: (val) {
                        return ValidInput(val!, 5, 100, "username");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormAuth(
                      hintText: '13'.tr,
                      labelText: '14'.tr,
                      iconData: Icons.email_outlined, mycontroller: controller.email,
                      valid: (val) {
                        return ValidInput(val!, 5, 100, "email");
                      },
                      isNumber: false,
                    ),
                    CustomTextFormAuth(
                      hintText: '23'.tr,
                      labelText: '24'.tr,
                      iconData: Icons.phone_android_outlined, mycontroller: controller.phone,
                      isNumber: true,
                      valid: (val) {
                        return ValidInput(val!, 5, 100, "phone");
                      },
                    ),

                    CustomTextFormAuth(
                      hintText: '15'.tr,
                      labelText: '16'.tr,
                      iconData: controller.isShowPassword ? Icons.lock_open_outlined : Icons.lock_outline,
                      mycontroller: controller.password,
                      obscureText: controller.isShowPassword,
                      onTap: () {
                        controller.showPassword();
                      },
                      valid: (val) {
                        return ValidInput(val!, 5, 30, "password");
                      },
                      isNumber: false,
                            ),
                    const SizedBox(height: 30),
                    CustomButtonAuth(
                        text: "25".tr,
                        onPressed: () {
                          controller.signUp();
                        }),
                    const SizedBox(height: 30),
                    TextSignUp(
                        textTwo: "10".tr,
                        textOne: "26".tr,
                        onTap: () {
                          controller.goToLogIn();
                        }),
                  ]),
                ),
              ),
      ),
    );
  }
}
