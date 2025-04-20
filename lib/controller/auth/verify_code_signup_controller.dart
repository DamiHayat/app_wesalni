import 'package:first_project_flutter/core/constant/routes.dart';
import 'package:get/get.dart';
import '../../core/class/statut_request.dart';
import '../../core/functions/handlin_data_controller.dart';
import '../../data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;
  // Variable réactive pour le statut de la requête
  var statusRequest = StatusRequest.none.obs;

  @override
  void onInit() {
    super.onInit();
    // Récupération de l'email depuis les arguments
    email = Get.arguments['email'];
    print("Email reçu pour vérification : $email"); // Pour le débogage
  }

  @override
  checkCode() {
    // Optionnel : implémenter des validations locales sur le code
  }

  @override
  goToSuccessSignUp(String verifyCodeSignUp) async {
    if (email == null) {
      Get.defaultDialog(
        title: "Erreur",
        middleText: "L'adresse email est manquante.",
      );
      return;
    }

    // Mettre à jour le statut en mode chargement
    statusRequest.value = StatusRequest.loading;

    try {
      // Appel API pour vérifier le code
      var response = await verfiyCodeSignUpData.postdata(email!, verifyCodeSignUp);

      // Traitement de la réponse via une fonction helper
      statusRequest.value = handlingData(response);
      print("Response: $response");

      // Vérification du statut de la réponse
      if (statusRequest.value == StatusRequest.success) {
        if (response != null && response.containsKey('status') && response['status'] == "success") {
          // Redirection vers la page de succès
          print("Vérification avec succès");
          Get.offNamed(AppRoute.successSignUp);
        } else {
          Get.defaultDialog(
            title: "Avertissement",
            middleText: response['message'] ?? "Le code de vérification n'est pas correct",
          );
          statusRequest.value = StatusRequest.failure;
        }
      } else {
        Get.defaultDialog(
          title: "Erreur",
          middleText: "Une erreur s'est produite. Veuillez réessayer.",
        );
      }
    } catch (e) {
      // En cas d'erreur réseau ou autre
      print("Erreur lors de la vérification : $e");
      Get.defaultDialog(
        title: "Erreur",
        middleText: "Une erreur est survenue. Veuillez vérifier votre connexion et réessayer.",
      );
      statusRequest.value = StatusRequest.failure;
    }
  }

  // Fonction pour renvoyer un nouveau code de vérification
  reSend() {
    if (email != null) {
      verfiyCodeSignUpData.resendData(email!);
    }
  }
}
