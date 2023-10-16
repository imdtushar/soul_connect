import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/data/model/relationship_model.dart';
import 'package:soul_connect/app/modules/relationship/relationship_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class RelationShipScreen extends BaseView<RelationShipScreenController> {
  RelationShipScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              text: "What type of\nrelationship are you\nlooking for?",
            ),
            SizedBox(
              height: 15.h,
            ),
            BodyUi(controller: controller),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomElevatedButton(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(RouterName.presentation);
                },
                text: "Next",
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BodyUi extends StatelessWidget {
  final RelationShipScreenController controller;

  const BodyUi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10.w,
          );
        },
        itemCount: controller.dataCollection.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = RelationshipModel(
            topText: controller.dataCollection[index]['topText'],
            text: controller.dataCollection[index]['Text'],
          );
          return InkWell(
            onTap: () => controller.selectIndex(index),
            child: ContainerView(
              textTop: item.topText,
              text: item.text,
              controller: controller,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class ContainerView extends StatelessWidget {
  final String text;
  final String textTop;
  final int index;
  final RelationShipScreenController controller;

  const ContainerView({
    super.key,
    required this.text,
    required this.controller,
    required this.textTop,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      padding: EdgeInsets.symmetric(vertical: 28.h),
      decoration: controller.selectedValue == index
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
              border: Border.all(color: AppColors.gradientStart),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0C000000),
                  blurRadius: 4.r,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0C000000),
                  blurRadius: 4.r,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: textTop,
              style: poppinsMedium.copyWith(
                fontSize: 40.sp,
              ),
            ),
            TextSpan(
              text: text,
              style: poppinsMedium.copyWith(
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
