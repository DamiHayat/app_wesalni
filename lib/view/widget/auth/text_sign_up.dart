import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TextSignUp extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function()? onTap;
  const TextSignUp({super.key, required this.textOne, required this.textTwo,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            textOne,
        ),
        InkWell(
          onTap: onTap,
          child:
        Text(
            textTwo,
            style:
            const TextStyle(
                color: AppColor.green,
                fontWeight: FontWeight.bold)
        ),
        ),
      ],
    );
  }
}
