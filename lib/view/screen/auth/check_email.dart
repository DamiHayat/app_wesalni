import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/check_email_controller.dart';
import '../../../core/functions/validinputs.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/custom_text_form_auth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child : Form(
          key: controller.formstate,
          child: ListView(children:   [
            const CustomTextTitleAuth(text: "Vérifier l'adresse email"),
            const  SizedBox(height: 10),
            const CustomTextBodyAuth(text: "Inscription réussie"),
            const SizedBox(height: 20),
            CustomTextFormAuth(
              hintText: 'Entrez votre adresse email',
              labelText: 'email',
              iconData: Icons.email_outlined, mycontroller: controller.email,
              valid: (val ) {
                return ValidInput(val!, 5, 100, "email");
              },
              isNumber: false,

            ),
            CustomButtonAuth(
                text: "Vérifier",
                onPressed: (){
                  controller.goToSuccessSignUp();
                }),
            const SizedBox(height: 30),
          ],),
        ),
      ),
    );

  }
}
