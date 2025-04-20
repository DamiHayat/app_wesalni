import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:first_project_flutter/core/class/statut_request.dart';

import 'package:first_project_flutter/core/class/crud.dart';
import 'package:first_project_flutter/linkapi.dart';
import '../../core/functions/handlin_data_controller.dart';
import '../../data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeSignUpData verifyCodeData = VerfiyCodeSignUpData(Get.find());

  @override
  void onInit() {
    email = Get.arguments['email']; // ✅ récupère l’email depuis la page précédente
    super.onInit();
  }

  @override
  checkCode(String code) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verifyCodeData.postdata(email!, code);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Code de vérification incorrect",
        );
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword, arguments: {
      "email": email,
    });
  }
}