import 'package:soul_connect/app/modules/chat/chat_screen_binding.dart';
import 'package:soul_connect/app/modules/home/home_screen_binding.dart';
import 'package:soul_connect/app/modules/matches/matches_screen_binding.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:get/get.dart';
import '/app/modules/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<HomeScreenController>(
          () => HomeScreenController(),
      fenix: true,
    );
    Get.lazyPut<MatchesScreenController>(
      () => MatchesScreenController(),
      fenix: true,
    );
    Get.lazyPut<ProfileScreenController>(
          () => ProfileScreenController(),
      fenix: true,
    );
    Get.lazyPut<ChatScreenController>(
          () => ChatScreenController(),
      fenix: true,
    );
    // Get.lazyPut<CallController>(
    //   () => CallController(),
    //   fenix: true,
    // );
    // Get.lazyPut<ExpertsController>(
    //   () => ExpertsController(),
    //   fenix: true,
    // );

  }
}
