import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final  String labelText;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final void Function()? onTap;
  final bool isNumber;
  final bool? obscureText ;
  const CustomTextFormAuth({super.key, required this.hintText,  required this.labelText, required this.iconData, required this.mycontroller, required this.valid, required this.isNumber,  this.obscureText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        controller : mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText,)
            ),
            suffixIcon: InkWell(
                child: Icon(iconData),
              onTap: onTap,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            )

        ),
      ),
    );
  }
}
