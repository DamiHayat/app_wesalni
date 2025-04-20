import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.white,
        onPressed: onPressed,
        child: Text(textButton, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
