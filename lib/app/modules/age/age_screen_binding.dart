import 'dart:math';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class AgeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => AgeScreenController(),
      fenix: true,
    );
  }
}

class AgeScreenController extends BaseController {

  DateTime date = DateTime(2000, 01, 01);

  DateTime now = DateTime.now();

  int get differenceInYears {
    int diff = now.year - date.year;
    return max(0, diff);
  }


}
