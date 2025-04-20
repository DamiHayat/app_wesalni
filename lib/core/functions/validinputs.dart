import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type){
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "Nom d'utilisateur non valide";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "Adresse email non valide";
    }
  }
  if(val.isEmpty){
    return "Ne peut pas être vide";
  }
  if(val.length < min){
      return "Ne peut pas être inférieur à $min";
  }
  if(val.length > max){
    return "Ne peut pas être supérieur à $max";

  }
}