import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class ReligionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReligionScreenController(), fenix: true);
  }
}

class ReligionScreenController extends BaseController {
  int selectedValue = 0;
  List likeData = [
    "Agnostic",
    "Atheist",
    "Buddhist",
    "Catholic",
    "Christian",
    "Hindu",
    "Jewish",
    "Sikh",
    "Muslim",
    "Spiritual",
    "Other",
  ];

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
}