import 'dart:io';
import 'package:first_project_flutter/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() async {
  bool exitApp = false;

  await Get.defaultDialog(
    title: 'Alerte',
    middleText: 'Voulez-vous vraiment quitter l\'application ?',
    actions: [
      ElevatedButton(
        onPressed: () {
          exitApp = true;
          exit(0);
        },
        child: const Text('Oui'),
        style: _buttonStyle(),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Non'),
        style: _buttonStyle(),
      ),
    ],
  );

  return exitApp;
}

ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(
    foregroundColor: AppColor.green,
    backgroundColor: Colors.white ,// Couleur de fond
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Style du texte
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Forme du bouton
    ),

    elevation: 4, // Élévation
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Marge intérieure
  );
}
