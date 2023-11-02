import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class PushNotificationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PushNotificationScreenController(), fenix: true);
  }
}

class PushNotificationScreenController extends BaseController {

  bool newMatches = false;
  bool messages = false;
  bool messageLike = false;
  bool superLike = false;
  bool topPicks = false;
  bool newLikes = false;
}