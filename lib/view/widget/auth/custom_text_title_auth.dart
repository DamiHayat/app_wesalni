import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.grey, fontSize: 25),

    );
  }
}
