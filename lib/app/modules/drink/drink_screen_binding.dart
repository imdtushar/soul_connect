import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class DrinkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrinkScreenController(), fenix: true);
  }
}

class DrinkScreenController extends BaseController {
  int selectedValue = 0;
  List likeData = [
    "Yes",
    "NO",
    "Sometimes"
  ];

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
}