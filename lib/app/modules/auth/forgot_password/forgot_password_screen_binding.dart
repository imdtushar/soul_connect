import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class ForgotPassScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => ForgotPassScreenController(),
      fenix: true,
    );
  }
}

class ForgotPassScreenController extends BaseController {

  TextEditingController mobileNumberController = TextEditingController();

  // CountyCode
  String countryCode = '+91';

  @override
  void onClose() {
    super.onClose();
    mobileNumberController.dispose();
  }

}
