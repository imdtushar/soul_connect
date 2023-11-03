import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class ChangePasswordScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordScreenController(), fenix: true);
  }
}

class ChangePasswordScreenController extends BaseController {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController createPassword = TextEditingController();
}
