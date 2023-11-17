import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class FilterScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterScreenController(), fenix: true);
  }
}

class FilterScreenController extends BaseController {
  double distance = 0.0;
  RangeValues currentRangeValues = const RangeValues(25, 30);

  // Switch
  bool photos = false;
  bool bio = false;
  bool school = false;
  bool work = false;
  bool facebook = false;
  bool instagram = false;




  List education = [
    "High School",
    "Undergrad",
    "Postgraduate",
  ];
  List familyPLan = [
    "I want children",
    "I don’t want children",
    "I have children and want more",
    "I have children and don’t want more",
    "Not sure yet",
  ];
  List communication = [
    "WhatsApp",
    "Big time texter",
    "Phone Caller",
    "Video chatter",
    "Bad Texter",
    "Better in person",
  ];
  List pet = [
    "Dog",
    "Cat",
    "Reptile",
    "Amphibian",
    "Bird",
    "Fish",
    "Don’t have but love",
    "Others",
    "Want a pet",
    "All the pets",
  ];
  List drinking = [
    "Yes",
    "NO",
    "Sometimes",
  ];
  List workout = [
    "Everyday",
    "Often",
    "Sometimes",
    "Never",
  ];

  List dietaryPreference = [
    "Vegetarian",
    "Vegan",
    "Pescatarians",
    "Kosher",
    "Carnivore",
    "Omnivore",
    "Other",
  ];
  List socialMedia = [
    "Influence status",
    "Socially active",
    "Off the grid",
    "Passive scroller",
  ];  List sleepingHabits = [
    "Early bird",
    "Night owl",
    "In a septum",
  ];
}
