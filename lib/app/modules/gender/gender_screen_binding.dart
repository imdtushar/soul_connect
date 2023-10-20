import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class GenderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenderScreenController(), fenix: true);
  }
}

class GenderScreenController extends BaseController {
  bool isSelected = false;


  void selectedValue() {
    if(isSelected){
      isSelected = false;
    }else{
      isSelected = true;
    }
    update();
  }

}
