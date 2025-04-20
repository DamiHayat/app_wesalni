import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/functions/validinputs.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';
import '../../../widget/auth/custom_text_form_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text("40".tr, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17))
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            CustomTextTitleAuth(text: "41".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "42".tr),
            const SizedBox(height: 20),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                hintText: "",
                labelText: "16".tr,
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
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                hintText: "",
                labelText: "38".tr,
                iconData: controller.isShowPassword ? Icons.lock_open_outlined : Icons.lock_reset_outlined,
                mycontroller: controller.repassword,
                obscureText: controller.isShowPassword,
                onTap: () {
                  controller.showPassword();
                },
                valid: (val) {
                  return ValidInput(val!, 5, 30, "password");
                },
                isNumber: false,
              ),
            ),
            CustomButtonAuth(
              text: "39".tr,
              onPressed: () {
                controller.goToSuccessResetPassword();
              },
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
