import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class EmailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailScreenController(), fenix: true);
  }
}

class EmailScreenController extends BaseController {
  TextEditingController emailController = TextEditingController();
  bool soulConnect = false;
  bool newMessage = false;
  bool newMatches = false;
}
