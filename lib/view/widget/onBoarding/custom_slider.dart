import 'package:first_project_flutter/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
    itemCount: onBoardingList.length,
    itemBuilder: (context, i) =>  Column(
    children: [
    Image.asset(onBoardingList[i].image!, width: 300, height: 300, fit: BoxFit.fill,),
    const SizedBox(height: 80),
      Text(onBoardingList[i].title!, textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge),
      const SizedBox(height: 20),

      Container(
    width: double.infinity,
    alignment: Alignment.center,
    child: Text(onBoardingList[i].body!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
    )
  ],
  )

  );
  }
}
