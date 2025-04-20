import 'package:first_project_flutter/core/constant/color.dart';
import 'package:first_project_flutter/core/constant/imageasset.dart';
import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:first_project_flutter/core/services/services.dart';
import 'package:first_project_flutter/view/widget/language/custom_button_lang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localisation/changelocal.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.green,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),),
            const SizedBox(height: 20),
            CustomButtonLang(textButton: "3".tr, onPressed: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onboarding);
            }),
            CustomButtonLang(textButton: "2".tr, onPressed: (){
              controller.changeLang("fr");
              Get.toNamed(AppRoute.onboarding);
            }),

          ],
        ),
      ),
    );
  }
}
