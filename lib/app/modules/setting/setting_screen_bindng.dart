import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class SettingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingScreenController(), fenix: true);
  }
}

class SettingScreenController extends BaseController {}