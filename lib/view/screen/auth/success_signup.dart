import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constant/routes.dart';
import '../../widget/auth/custom_button_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text('30'.tr, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17))
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Spacer(),
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.green,
              ),
            ),
            Text("31".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30)
            ),
            Text("32".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                  text: "10".tr,
                  onPressed: () {
                    Get.offNamed(AppRoute.login);
                  }
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
