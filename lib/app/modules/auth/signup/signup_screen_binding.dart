import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class SignupScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupScreenController(),
      fenix: true,
    );
  }
}

class SignupScreenController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
