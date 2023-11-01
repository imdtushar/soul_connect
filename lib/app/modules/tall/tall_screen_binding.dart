import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class TallScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TallScreenController(), fenix: true);
  }
}

class TallScreenController extends BaseController {

  bool isFeet = false;
  List heightFeet = [
    "4'0\"",
    "4'1\"",
    "4'2\"",
    "4'3\"",
    "4'4\"",
    "4'5\"",
    "4'6\"",
    "4'7\"",
    "4'8\"",
    "4'9\"",
    "4'10\"",
    "4'11\"",
    "5'0\"",
    "5'1\"",
    "5'2\"",
    "5'3\"",
    "5'4\"",
    "5'5\"",
    "5'6\"",
    "5'7\"",
    "5'8\"",
    "5'9\"",
    "5'10\"",
    "5'11\"",
    "6'0\"",
    "6'1\"",
    "6'2\"",
    "6'3\"",
    "6'4\"",
    "6'5\"",
    "6'6\"",
    "6'7\"",
    "6'8\"",
    "6'9\"",
    "6'10\"",
    "6'11\"",
    "7'0\"",
    "7'1\"",
    "7'2\"",
    "7'3\"",
    "7'4\"",
    "7'5\"",
    "7'6\"",
    "7'7\"",
    "7'8\"",
    "7'9\"",
    "7'10\"",
    "7'11\"",
    "8'0\""
  ];

  List heightCm = [
    "121.92 cm",
    "124.46 cm",
    "126.99 cm",
    "129.54 cm",
    "132.08 cm",
    "134.61 cm",
    "137.16 cm",
    "139.70 cm",
    "142.24 cm",
    "144.78 cm",
    "147.32 cm",
    "149.86 cm",
    "152.40 cm",
    "154.94 cm",
    "157.48 cm",
    "160.02 cm",
    "162.56 cm",
    "165.10 cm",
    "167.64 cm",
    "170.18 cm",
    "172.72 cm",
    "175.26 cm",
    "177.80 cm",
    "180.34 cm",
    "182.88 cm",
    "185.42 cm",
    "187.96 cm",
    "190.50 cm",
    "193.04 cm",
    "195.58 cm",
    "198.12 cm",
    "200.66 cm",
    "203.20 cm",
    "205.74 cm",
    "208.28 cm",
    "210.82 cm",
    "213.36 cm",
    "215.90 cm",
    "218.44 cm",
    "220.98 cm",
    "223.52 cm",
    "226.06 cm",
    "228.60 cm",
    "231.14 cm",
    "233.68 cm",
    "236.22 cm",
    "238.76 cm",
    "241.30 cm",
    "243.84 cm"
  ];

  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
}
