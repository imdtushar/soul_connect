import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/modules/matches/matches_screen_binding.dart';

class MatchesScreen extends BaseView<MatchesScreenController> {
  MatchesScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Center(
          child: Text('Matches'),
        ),
      ),
    );
  }
}
