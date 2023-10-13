import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class YourSelfScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => YourSelfScreenController(),
      fenix: true,
    );
  }
}

class YourSelfScreenController extends BaseController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
  }
}
