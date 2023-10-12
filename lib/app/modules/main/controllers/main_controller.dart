import 'package:soul_connect/app/modules/home/home_screen.dart';
import 'package:soul_connect/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:soul_connect/app/modules/main/views/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }

  final Widget homeView = KeepAlivePage(
    child: HomeScreen(),
  );



  // FavoriteView? favoriteView;
  // SettingsView? settingsView;
  Widget? wishListView;
  Widget? chatView;
  Widget? profileView;
  Widget? categoryView;
  final navController = Get.put(BottomNavController());

  expertsTap() {
    navController.updateSelectedIndex(2);
    navController.pageController.jumpToPage(2);
    update();
  }
}
