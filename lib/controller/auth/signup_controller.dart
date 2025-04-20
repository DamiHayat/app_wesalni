import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statut_request.dart';
import '../../core/functions/handlin_data_controller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late StatusRequest statusRequest;

  SignupData signupData = SignupData(Get.find());
  List data = [];
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  signUp() async {
    print(">>> signUp button pressed");

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      String name = username.text.trim();
      String mail = email.text.trim().toLowerCase();
      String pass = password.text;
      String phoneNumber = phone.text.trim();

      try {
        var response = await signupData.postdata(name, pass, mail, phoneNumber);

        print("========================");
        print(response);

        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
              'email': email.text.trim().toLowerCase(),
            });
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email Already Exists",
            );
            statusRequest = StatusRequest.failure;
          }
        }
      } catch (e) {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
          title: "Error",
          middleText: "An error occurred: $e",
        );
      }

      update();
    }
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  // Validation functions
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
