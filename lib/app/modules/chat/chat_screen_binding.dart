import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController(), fenix: true);
  }
}

class ChatScreenController extends BaseController {
  TextEditingController search = TextEditingController();
  var initalPos = 0;

  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');



}