import 'package:first_project_flutter/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
    color: AppColor.green,
        margin : const EdgeInsets.only(bottom: 30),
    child:  MaterialButton(
      textColor: Colors.white,
      height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 100),
      onPressed: () {
        controller.next();
      },
      child: Text("9".tr)
    )
    );
  }
}
