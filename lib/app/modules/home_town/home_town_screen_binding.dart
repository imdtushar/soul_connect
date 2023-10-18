import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class HomeTownScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => HomeTownScreenController(),
      fenix: true,
    );
  }
}

class HomeTownScreenController extends BaseController {
  TextEditingController homeTownController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    homeTownController.dispose();
  }
}
