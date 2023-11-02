import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class TeamNotificationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamNotificationScreenController(), fenix: true);
  }
}

class TeamNotificationScreenController extends BaseController {
bool teamNotification = false;
}