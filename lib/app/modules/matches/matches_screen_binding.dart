import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class MatchesScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchesScreenController(), fenix: true);
  }
}

class MatchesScreenController extends BaseController {}