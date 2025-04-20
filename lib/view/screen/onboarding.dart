import 'package:first_project_flutter/controller/onboarding_controller.dart';
import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widget/onBoarding/custom_button.dart';
import '../widget/onBoarding/custom_slider.dart';
import '../widget/onBoarding/dots_controller.dart';

class OnBoarding extends StatelessWidget{
  const OnBoarding({Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
            children: [
              const SizedBox(height: 20),
              CustomDotsControllerOnBoarding(),
               Spacer(flex: 2),
               CustomButtonOnBoarding()

            ],
          ),
             

          )

        ]),
      )
      );
  }


}