import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class RelationShipScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RelationShipScreenController(),
      fenix: true,
    );
  }
}

class RelationShipScreenController extends BaseController {
  bool isSelected = false;
  int selectedValue = 0;

  void selectIndex(int index) {
    selectedValue = index;
    update();
  }
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
      {"topText": "💝", "Text": "\nLong-term\npartner"},
      {"topText": "🥂", "Text": "\nShort-term\nfun-term"},
      {"topText": "😍", "Text": "\nNew Friends"}
    ];
  }
}
