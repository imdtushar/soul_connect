import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class CertificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificationScreenController(), fenix: true);
  }
}

class CertificationScreenController extends BaseController {
  int selectedValue = 0;
  List likeData = [
    "High School",
    "Undergrad",
    "Postgrad",
  ];

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
}