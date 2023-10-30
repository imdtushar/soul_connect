import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends BaseView<ProfileScreenController> {
  ProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1582391988484-3f1691bc1401?auto=format&fit=crop&q=80&w=2093&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
