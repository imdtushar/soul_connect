import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginScreenController(),
      fenix: true,
    );
  }
}

class LoginScreenController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}


