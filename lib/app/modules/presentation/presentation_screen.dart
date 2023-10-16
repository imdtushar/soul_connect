import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/modules/presentation/presentation_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';

class PresentationScreen extends BaseView<PresentationScreenController> {
  PresentationScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              text: "It’s all about\nPresentation 📸",
            ),
            SizedBox(
              height: 15.h,
            ),

          ],
        ),
      ),
    );
  }
}