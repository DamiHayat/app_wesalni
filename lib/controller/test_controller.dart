import 'package:dartz/dartz.dart';
import 'package:first_project_flutter/core/class/statut_request.dart';
import 'package:first_project_flutter/core/functions/handlin_data_controller.dart';
import 'package:first_project_flutter/data/datasource/remote/test_dart.dart';
import 'package:get/get.dart';

class TestController extends GetxController{
    TestData testData = TestData(Get.find());
    List data = [];
    late StatusRequest statusRequest;
    getData() async{
        statusRequest = StatusRequest.loading;
        var response = await testData.getData();
        statusRequest = handlingData(response);
        if(statusRequest == StatusRequest.success){
          if(response['status'] == "success"){
            data.addAll(response['data']);
          }else{
            statusRequest = StatusRequest.failure;
          }
        }
        update();
    }
    @override
  void onInit() {
    getData();
    super.onInit();
  }
}