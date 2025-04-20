import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verify_code_signup_controller.dart';
import '../../../core/class/statut_request.dart';
import '../../widget/auth/custom_text_body_auth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeSignUpControllerImp controller =
    Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "Vérification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        // Utilisation d'une Stack pour ne pas reconstruire le champ OTP
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                // Texte indiquant d'entrer le code OTP
                const CustomTextBodyAuth(
                  text: "Entrez le code envoyé à votre email.",
                ),
                const SizedBox(height: 20),
                // Champ OTP qui ne dépend pas de la variable reactive
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderWidth: 5,
                  focusedBorderColor: AppColor.green,
                  borderColor: AppColor.green,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Vous pouvez ajouter ici une validation locale si nécessaire
                  },
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  },
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () => controller.reSend(),
                  child: const Text("Renvoyer le code"),
                ),
              ],
            ),
            // Indicateur de chargement affiché par-dessus en cas de status loading.
            Obx(() => controller.statusRequest.value == StatusRequest.loading
                ? Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            )
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
