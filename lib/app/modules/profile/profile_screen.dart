import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends BaseView<ProfileScreenController> {
  ProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(child: Text("Profile")),
    );
  }


}
