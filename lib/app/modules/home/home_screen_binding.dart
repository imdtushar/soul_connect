import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
  }
}

class HomeScreenController extends BaseController {

  TextEditingController search = TextEditingController();

  // Category List Selected Index
  int? categoryIndex;

  // Home Feed List Selected Index
  int? homeFeedIndex;

  //Bottom Show Hide
  bool bottomIsShow = true;



  //List Of Location
  String selectedItem = 'Ahmedabad';
  List<String> locationList = [
    'Ahmedabad',
    'Rajkot',
    'Surat',
  ];

  void onItemSelected(newValue) {
    selectedItem = newValue;
    update();
  }

}
