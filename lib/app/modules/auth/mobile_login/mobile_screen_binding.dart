import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class MobileLoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => MobileLoginScreenController(),
      fenix: true,
    );
  }
}

class MobileLoginScreenController extends BaseController {
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    mobileNumberController.dispose();
  }
}