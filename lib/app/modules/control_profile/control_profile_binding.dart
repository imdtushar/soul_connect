import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ControlProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlProfileController(), fenix: true);
  }
}

class ControlProfileController extends BaseController {
  bool showAge = false;
  bool showDistance = false;
}
