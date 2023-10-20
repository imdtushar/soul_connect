import 'package:get/get_rx/get_rx.dart';

class YourInterestsModel {
  final String icon;
  final String text;
  RxBool isSelected = false.obs;

  YourInterestsModel( { required this.icon, required this.text,  isSelected});
}