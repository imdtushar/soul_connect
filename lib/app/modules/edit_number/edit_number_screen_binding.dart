import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class EditNumberScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditNumberScreenController(), fenix: true);
  }
}

class EditNumberScreenController extends BaseController {
  TextEditingController mobileNumberController = TextEditingController();

  // CountyCode
  String countryCode = '+91';
}