import 'package:first_project_flutter/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotsControllerOnBoarding extends StatelessWidget {
  const CustomDotsControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>
      (builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBoardingList.length, (index) => AnimatedContainer(
          margin: const EdgeInsets.only(right: 5),
          duration: const Duration(milliseconds: 900),
          width: controller.currentPage == index ? 20 : 5,
          height: 6,
          decoration: BoxDecoration(
              color: AppColor.green,
              borderRadius: BorderRadius.circular(10)
          ),
        ))

      ],
    ));
  }
}
