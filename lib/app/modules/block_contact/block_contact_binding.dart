import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class BlockContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlockContactController(), fenix: true);
  }
}

class BlockContactController extends BaseController {}