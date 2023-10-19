import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/data/model/your_interest_model.dart';
import 'package:soul_connect/app/modules/widget/custom_app_bar.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/your_interests/your_interests_screen_binding.dart';

class YourInterestScreen extends BaseView<YourInterestScreenController> {
  YourInterestScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                text: "Your Interests 🤔",
                showSkip: true,
                skipOnTap: () {
                  FocusScope.of(context).unfocus();
                  // Get.toNamed(RouterName.drink);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Select a few of your interests and let everyone know what you’re passionate about.",
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index < controller.dataCollection.length) {
                    final item = YourInterestsModel(
                      isSelected: controller.dataCollection[index]
                          ['isSelected'],
                      icon: controller.dataCollection[index]['icon'],
                      text: controller.dataCollection[index]['Text'],
                    );
                    return InkWell(
                      onTap: () {
                        item.isSelected = !item.isSelected;

                        // controller.isSelected = !controller.isSelected;
                        controller.update();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        decoration: item.isSelected
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    AppColors.gradientStart,
                                    AppColors.gradientEnd
                                  ],
                                ),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.white,
                                border: Border.all(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: item.isSelected
                                  ? AppColors.white
                                  : AppColors.gradientStart,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              item.text,
                              style: poppinsRegular.copyWith(
                                fontSize: 16.sp,
                                color: item.isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
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
                    // Get.toNamed(RouterName.drink);
                  },
                  text: "Next",
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientOnErrorToPinkDecoration,
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
