import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/verify_code_controller.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            CustomTextTitleAuth(text: "28".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "29".tr),
            const SizedBox(height: 20),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderWidth: 5,
              focusedBorderColor: AppColor.green,
              borderColor: AppColor.green,
              // Définir à true pour montrer sous forme de boîte ou à false pour montrer comme un tiret
              showFieldAsBox: true,
              // Appelée lorsque du code est tapé
              onCodeChanged: (String code) {
                // Gérer la validation ou les vérifications ici
              },
              // Appelée lorsque tous les champs de texte sont remplis
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // fin onSubmit
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
