import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/filter/filter_screen_controller.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import '../../core/utils/image_constant.dart';
import '../../core/values/app_colors.dart';
import '../../routes/router_name.dart';
import '../widget/common_list_widget.dart';
import '../widget/custome_page_appbar.dart';

class FilterScreen extends BaseView<FilterScreenController> {
  FilterScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageAppBar(
                title: "Filter",
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your current location",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/location_filter.svg",
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Ahmedabad",
                              style: poppinsRegular.copyWith(
                                fontSize: 16.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          height: 28.h,
                          width: 100.w,
                          onTap: () {},
                          text: 'UPDATE',
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientOnErrorToPinkDecoration,
                          buttonTextStyle: poppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Maximum Distance",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "100 mi.",
                            style: poppinsMedium.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Text(
                        "Show people within this radius",
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Slider(
                      activeColor: AppColors.gradientStart,
                      value: controller.distance,
                      onChanged: (value) {
                        controller.distance = value;
                        controller.update();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age range",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "${controller.currentRangeValues.start.round()} - ${controller.currentRangeValues.end.round()}",
                            style: poppinsMedium.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RangeSlider(
                      values: controller.currentRangeValues,
                      max: 100,
                      activeColor: AppColors.gradientStart,
                      divisions: 100,
                      onChanged: (RangeValues value) {
                        controller.currentRangeValues = value;
                        controller.update();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Show me",
                      style: poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Male",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SvgPicture.asset(
                          ImageConstant.arrow,
                          height: 14.h,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  children: [
                    ListDesign(
                      onTap: () {
                        Get.toNamed(RouterName.yourInterest);
                      },
                      title: "Interests",
                      icon: ImageConstant.interestIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Education',
                          listPass: controller.education,
                          btnClick: () {},
                        );
                      },
                      title: "Education",
                      icon: ImageConstant.education,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Family Plans',
                          listPass: controller.familyPLan,
                          btnClick: () {},
                        );
                      },
                      title: "Family Plans",
                      icon: ImageConstant.familyPlan,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Communication Style',
                          listPass: controller.communication,
                          btnClick: () {},
                        );
                      },
                      title: "Communication Style",
                      icon: ImageConstant.communicationIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Pets',
                          listPass: controller.pet,
                          btnClick: () {},
                        );
                      },
                      title: "Pets",
                      icon: ImageConstant.petsIcons,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Drinking',
                          listPass: controller.drinking,
                          btnClick: () {},
                        );
                      },
                      title: "Drinking",
                      icon: ImageConstant.drinkingIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Workout',
                          listPass: controller.workout,
                          btnClick: () {},
                        );
                      },
                      title: "Workout",
                      icon: ImageConstant.workoutIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Dietary Preference',
                          listPass: controller.dietaryPreference,
                          btnClick: () {},
                        );
                      },
                      title: "Dietary Preference",
                      icon: ImageConstant.dietaryIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Social Media',
                          listPass: controller.socialMedia,
                          btnClick: () {},
                        );
                      },
                      title: "Social Media",
                      icon: ImageConstant.socialMediaIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Sleeping Habits',
                          listPass: controller.sleepingHabits,
                          btnClick: () {},
                        );
                      },
                      title: "Sleeping Habits",
                      icon: ImageConstant.sleepingIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  "Shared Content",
                  style: poppinsSemiBold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.cornerColor,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Photos",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.photos,
                              onChanged: (value) {
                                controller.photos = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bio",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.bio,
                              onChanged: (value) {
                                controller.bio = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "School",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.school,
                              onChanged: (value) {
                                controller.school = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Work",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.work,
                              onChanged: (value) {
                                controller.work = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Facebook",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.facebook,
                              onChanged: (value) {
                                controller.facebook = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.dividerLine1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Instagram",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Switch(
                              activeColor: AppColors.white,
                              inactiveThumbColor: AppColors.white,
                              trackColor: MaterialStateProperty.all(
                                  AppColors.gradientStart),
                              trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                              value: controller.instagram,
                              onChanged: (value) {
                                controller.instagram = value;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List Design
class ListDesign extends StatelessWidget {
  const ListDesign({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  title,
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(ImageConstant.arrow),
          ],
        ),
      ),
    );
  }
}

//Divider Common Widget
class DividerScreen extends StatelessWidget {
  const DividerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: AppColors.dividerLine1,
    );
  }
}

// Navigation navigateToCommonListScreen Common Function
void navigateToCommonListScreen({
  required BuildContext context,
  required String title,
  required List<dynamic> listPass,
  required VoidCallback btnClick,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CommonListWidget(
        title: title,
        listPass: listPass,
        btnClick: btnClick,
      ),
    ),
  );
}
