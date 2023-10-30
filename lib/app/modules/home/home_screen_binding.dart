import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/data/model/example_card_model.dart';
import 'package:soul_connect/app/modules/home/home_screen.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
  }
}

class HomeScreenController extends BaseController {

  final CardSwiperController cardController = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();

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


  bool onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool onUndo(
      int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

