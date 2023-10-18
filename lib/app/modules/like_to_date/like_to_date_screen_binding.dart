import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class LikeToDateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikeToDateScreenController(), fenix: true);
  }
}

class LikeToDateScreenController extends BaseController {
  int selectedValue = -1;

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
}