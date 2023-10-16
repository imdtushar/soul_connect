import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class PresentationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => PresentationScreenController(),
      fenix: true,
    );
  }
}

class PresentationScreenController extends BaseController {


}
