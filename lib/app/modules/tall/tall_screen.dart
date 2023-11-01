import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/tall/tall_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/routes/router_name.dart';
import 'package:vertical_picker/vertical_picker.dart';

class TallScreen extends BaseView<TallScreenController> {
  TallScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(
                text: AppString.tallLbl,
              ),
              SizedBox(
                height: 300.h,
                child: VerticalPicker(
                  itemHeight: MediaQuery.of(context).size.height / 15,
                  items: List.generate(
                      controller.isFeet
                          ? controller.heightCm.length
                          : controller.heightFeet.length, (index) {
                    return Center(
                      child: Text(
                        controller.isFeet
                            ? controller.heightCm[index]
                            : controller.heightFeet[index],
                        style: poppinsMedium.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ),
                    );
                  }),
                  onSelectedChanged: (p0) {
                    if (controller.isFeet == false) {
                      if (p0 >= 0 && p0 < controller.heightFeet.length) {
                        String height = controller.heightFeet[p0];
                        print("Height at index $p0: $height");
                      }
                    } else {
                      if (p0 >= 0 && p0 < controller.heightCm.length) {
                        String height = controller.heightCm[p0];
                        print("Height at index $p0: $height");
                      }
                    }
                  },
                  borderColor: AppColors.black,
                  borderThickness: 1,
                  leftMargin: 46.w,
                  rightMargin: 46.w,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 5.h),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.black.withOpacity(0.1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Switch(

                    activeColor: AppColors.hintColor,
                    inactiveTrackColor: AppColors.hintColor,
                    trackOutlineColor:
                        MaterialStateProperty.all(Colors.transparent),
                    inactiveThumbImage: AssetImage(ImageConstant.ftIcon),
                    activeThumbImage: AssetImage(ImageConstant.cmIcon),
                    value: controller.isFeet,
                    onChanged: (value) {
                      controller.isFeet = value;
                      controller.update();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: CustomElevatedButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(RouterName.homeTownScreen);
                  },
                  text: AppString.nextBtn,
                  buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                  buttonTextStyle: poppinsMedium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
