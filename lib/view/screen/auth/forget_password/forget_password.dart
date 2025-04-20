import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forget_password_controller.dart';
import '../../../../core/functions/validinputs.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';
import '../../../widget/auth/custom_text_form_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text('33'.tr, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17))
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            CustomTextTitleAuth(text: "34".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 20),
            CustomTextFormAuth(
              hintText: '36'.tr,
              labelText: '14'.tr,
              iconData: Icons.email_outlined, mycontroller: controller.email,
              valid: (val) {
                return ValidInput(val!, 5, 30, "email");
              },
              isNumber: false,
            ),
            CustomButtonAuth(
                text: "37".tr,
                onPressed: () {
                  controller.goToVerifyCode();
                }
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
