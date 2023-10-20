import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class YourInterestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourInterestScreenController(), fenix: true);
  }
}

class YourInterestScreenController extends BaseController {


  List<Map<String, dynamic>> dataCollection = [];

  @override
  void onInit() {
    super.onInit();
    fetchData().then((data) {
      dataCollection = data!;
      update();
    });
  }

  Future<List<Map<String, dynamic>>?> fetchData() async {
    return [
      {"icon": "💝", "Text": "Traveling", "isSelected": false},
      {"icon": "💝", "Text": "Shopping", "isSelected": true},
      {"icon": "💝", "Text": "Karaoke", "isSelected": false},
      {"icon": "💝", "Text": "Yoga", "isSelected": false},
      {"icon": "💝", "Text": "Cooking", "isSelected": true},
      {"icon": "💝", "Text": "Tennis", "isSelected": false},
      {"icon": "💝", "Text": "Run", "isSelected": false},
      {"icon": "💝", "Text": "Swimming", "isSelected": true},
      {"icon": "💝", "Text": "Extreme", "isSelected": false},
      {"icon": "💝", "Text": "Music", "isSelected": true},
      {"icon": "💝", "Text": "Drink", "isSelected": false},
      {"icon": "💝", "Text": "Video games", "isSelected": true},
      {"icon": "💝", "Text": "Art", "isSelected": false},
      {"icon": "💝", "Text": "Photography", "isSelected": true}
    ];
  }
}
