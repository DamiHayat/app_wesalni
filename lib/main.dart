import 'package:first_project_flutter/core/localisation/translation.dart';
import 'package:first_project_flutter/routes.dart';
import 'package:first_project_flutter/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'bindings/initialbindings.dart';
import 'core/constant/color.dart';
import 'core/localisation/changelocal.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}

