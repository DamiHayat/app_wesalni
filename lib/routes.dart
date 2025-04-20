import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:first_project_flutter/test.dart';
import 'package:first_project_flutter/test_view.dart';
import 'package:first_project_flutter/view/screen/auth/forget_password/forget_password.dart';
import 'package:first_project_flutter/view/screen/auth/forget_password/reset_password.dart';
import 'package:first_project_flutter/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:first_project_flutter/view/screen/auth/forget_password/verify_code.dart';
import 'package:first_project_flutter/view/screen/auth/login.dart';
import 'package:first_project_flutter/view/screen/auth/signup.dart';
import 'package:first_project_flutter/view/screen/auth/success_signup.dart';
import 'package:first_project_flutter/view/screen/auth/verify_code_signup.dart';
import 'package:first_project_flutter/view/screen/bus_detail_screen.dart';
import 'package:first_project_flutter/view/screen/language.dart';
import 'package:first_project_flutter/view/screen/onboarding.dart';
import 'package:first_project_flutter/view/screen/root_page.dart';
import 'package:first_project_flutter/view/screen/show_map.dart';
import 'package:first_project_flutter/view/screen/user_home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'bindings/bus_detail_binding.dart';
import 'bindings/user_home_binding.dart';
import 'core/middleware/my_middle_ware.dart';


List<GetPage<dynamic>>? routes = [
    /*GetPage(name: "/", page: () => const Language() , middlewares: [
        MyMiddleware()
    ]),*/
    GetPage(name: "/", page: () =>  RootPage()
    ),
    GetPage(name: AppRoute.login, page: () => const Login()),
    GetPage(name: AppRoute.signup, page: () => const SignUp()),
    GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
    GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
    GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
    GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
    GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
    GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
    GetPage(name: AppRoute.rootPage, page: () => const RootPage()),
    GetPage(name: AppRoute.showMap, page: () =>  Home()),

    GetPage(
        name: AppRoute.userHomeScreen,
        page: () => const UserHomeScreen(),
        binding: UserHomeBinding(),
    ),

    GetPage(
        name: AppRoute.busDetailScreen,
        page: () => const BusDetailScreen(),
        binding: BusDetailBinding(),
    ),

];
