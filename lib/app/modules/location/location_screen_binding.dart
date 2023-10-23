import 'package:flutter/cupertino.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationScreenController(), fenix: true);
  }
}

class LocationScreenController extends BaseController {
  TextEditingController location = TextEditingController();
  TextEditingController newLocation = TextEditingController();
}
