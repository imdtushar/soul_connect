import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class OtherProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherProfileScreenController(), fenix: true);
  }
}

class OtherProfileScreenController extends BaseController {
  final CarouselController carouselController = CarouselController();
  int? indexValue;

}