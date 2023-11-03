import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class AccountSettingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountSettingScreenController(), fenix: true);
  }
}

class AccountSettingScreenController extends BaseController {}