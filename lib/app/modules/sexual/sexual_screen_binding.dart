import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class SexualScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SexualScreenController(),
      fenix: true,
    );
  }
}

class SexualScreenController extends BaseController {

  int selectedValue = 0;

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
}
