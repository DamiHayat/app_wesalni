import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeFrensh =  ThemeData(
textTheme:  TextTheme(
  displayLarge:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  bodyLarge :TextStyle(height: 2, color: AppColor.grey, fontSize: 17),
  titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
),
);
ThemeData themeArabic =  ThemeData(
  fontFamily: 'Cairo',
  textTheme:  const TextTheme(
  displayLarge:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  bodyLarge :TextStyle(height: 2, color: AppColor.grey, fontSize: 17),
  titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
),
);