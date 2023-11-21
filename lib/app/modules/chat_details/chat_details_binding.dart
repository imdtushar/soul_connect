import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ChatDetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatDetailScreenController(), fenix: true);
  }
}

class ChatDetailScreenController extends BaseController {
  TextEditingController sendMessage = TextEditingController();

  bool isDoc = false;

}