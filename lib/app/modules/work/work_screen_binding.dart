import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class WorkScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => WorkScreenController(),
      fenix: true,
    );
  }
}

class WorkScreenController extends BaseController {
  TextEditingController workPlaceController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    workPlaceController.dispose();
  }
}
