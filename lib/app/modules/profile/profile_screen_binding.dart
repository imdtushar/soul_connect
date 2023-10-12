import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController(), fenix: true);
  }
}

class ProfileScreenController extends BaseController {}