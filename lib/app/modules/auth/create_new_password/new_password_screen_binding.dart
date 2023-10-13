import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class NewPasswordScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => NewPasswordScreenController(),
      fenix: true,
    );
  }
}

class NewPasswordScreenController extends BaseController {

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

}


