import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class NotificationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationScreenController(), fenix: true);
  }
}

class NotificationScreenController extends BaseController {

}