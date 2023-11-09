import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeletePauseAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeletePauseAccountController(), fenix: true);
  }
}

class DeletePauseAccountController extends BaseController {

}