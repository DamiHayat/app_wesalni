import 'package:first_project_flutter/core/functions/alert_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/functions/validinputs.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/custom_text_form_auth.dart';
import '../../widget/auth/logo_auth.dart';
import '../../widget/auth/text_sign_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(
        LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title:  Text("10".tr, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17))
      ),
      body: WillPopScope(onWillPop: AlertExitApp,
      child:Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child : Form(
          key: controller.formstate,
          child: ListView(children:   [
            LogoAuth(),
            CustomTextTitleAuth(text: "11".tr),
            const  SizedBox(height: 10),
            CustomTextBodyAuth(text: "12".tr),
            const SizedBox(height: 20),
            CustomTextFormAuth(
              hintText: '13'.tr,
              labelText: '14'.tr,
              iconData: Icons.email_outlined, mycontroller: controller.email,
              valid: (val ) {
                return ValidInput(val!, 5, 100, "email");
              },
              isNumber: false,

              //mycontroller : ,
            ),
            GetBuilder<LoginControllerImp>(
                builder: (controller) =>
              CustomTextFormAuth(
                hintText: '15'.tr,
                labelText: '16'.tr,
                iconData: controller.isShowPassword ? Icons.lock_open_outlined : Icons.lock_outline,
                mycontroller: controller.password,
                obscureText: controller.isShowPassword,
                onTap : (){  controller.showPassword();},
                valid: (val ) {
                  return ValidInput(val!, 5, 30, "password");
                },
                isNumber: false,
              )
            ),
            InkWell(
                onTap:
                    () {
                  controller.goToForgetPassword();
                }
                ,
                child:
                 Text("17".tr, textAlign: TextAlign.end,style: TextStyle(color: Colors.grey)
                )
            ),
            CustomButtonAuth(
                text: "18".tr,
                onPressed: (){
                  controller.login();
                }),
            const SizedBox(height: 30),
            TextSignUp( textTwo: "19".tr, textOne: "20".tr, onTap: (){ controller.goToSignUp();}),

          ],),
        ),
      )
        ,),

    );

  }
}
