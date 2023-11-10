import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/edit_profile/edit_profile_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'package:soul_connect/app/modules/widget/single_textfield_widget.dart';
import '../../routes/router_name.dart';
import '../widget/common_list_widget.dart';

class EditProfileScreen extends BaseView<EditProfileScreenController> {
  EditProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageAppBar(
                title: "Edit Profile",
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: Text(
                  "Media",
                  style: poppinsMedium.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ReorderableWrap(
                  runAlignment: WrapAlignment.center,
                  alignment: controller.pickedFileList.isNotEmpty
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,

                  minMainAxisCount: 3,
                  maxMainAxisCount: 3,
                  padding: controller.pickedFileList.isNotEmpty
                      ? EdgeInsets.zero
                      : EdgeInsets.symmetric(horizontal: 10.w),
                  direction: Axis.horizontal,
                  spacing: 2,
                  runSpacing: 2,
                  onReorder: (oldIndex, newIndex) {
                    final element =
                        controller.pickedFileList.removeAt(oldIndex);
                    controller.pickedFileList.insert(newIndex, element);
                    controller.update();
                  },
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  header: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.h, right: 6.w),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {
                          controller.imagePickerGallery(
                              controller.pickedFileList.length);
                        },
                        child: SvgPicture.asset(
                          ImageConstant.addPhotosIcon,
                          height: 150.w,
                          width: 122.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                  children:
                      controller.pickedFileList.asMap().entries.map((value) {
                    // final int index = value.key;
                    final image = value.value;

                    return SizedBox(
                      height: 156.w,
                      width: 122.w,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 150.w,
                              width: 114.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: AppColors.gradientStart,
                                  width: 2.w,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (ctx, url, err) => const Icon(
                                    CupertinoIcons.info,
                                    color: Color(0xFFF44336),
                                  ),
                                  height: 150.w,
                                  width: 114.w,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                controller.pickedFileList.remove(image);
                                controller.update();
                              },
                              child: SvgPicture.asset(ImageConstant.removeIcon),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20.h,
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
                        pushSingleTextFieldScreen(
                          context: context,
                          title: 'About',
                          onTap: () {},
                          controller: controller.aboutController,
                          hint: 'About yourself',
                        );
                      },
                      title: "About",
                      icon: ImageConstant.about,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Languages I Know',
                          listPass: controller.language,
                          btnClick: () {},
                        );
                      },
                      title: "Languages I Know",
                      icon: ImageConstant.languagesIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        navigateToCommonListScreen(
                          context: context,
                          title: 'Looking for',
                          listPass: controller.lookingFor,
                          btnClick: () {},
                        );
                      },
                      title: "Looking for",
                      icon: ImageConstant.lookingFor,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        Get.toNamed(RouterName.tall);
                      },
                      title: "Height",
                      icon: ImageConstant.heightIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
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
                height: 20.h,
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
                        pushSingleTextFieldScreen(
                          context: context,
                          title: 'Job Title',
                          onTap: () {},
                          controller: controller.jobTitleController,
                          hint: 'Enter your Job Title',
                        );
                      },
                      title: "Job Title",
                      icon: ImageConstant.jobTitleIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        pushSingleTextFieldScreen(
                          context: context,
                          title: 'Company',
                          onTap: () {},
                          controller: controller.companyController,
                          hint: 'Enter Company Name',
                        );
                      },
                      title: "Company",
                      icon: ImageConstant.companyIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        pushSingleTextFieldScreen(
                          context: context,
                          title: 'School',
                          onTap: () {},
                          controller: controller.companyController,
                          hint: 'Enter your School Name',
                        );
                      },
                      title: "School",
                      icon: ImageConstant.schoolIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        pushSingleTextFieldScreen(
                          context: context,
                          title: 'Living in',
                          onTap: () {},
                          controller: controller.cityController,
                          hint: 'Enter your City',
                        );
                      },
                      title: "Living in",
                      icon: ImageConstant.livingIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        Get.toNamed(RouterName.gender);
                      },
                      title: "Gender",
                      icon: ImageConstant.genderIcon,
                    ),
                    const DividerScreen(),
                    ListDesign(
                      onTap: () {
                        Get.toNamed(RouterName.sexualScreen);
                      },
                      title: "Sexual Orientation",
                      icon: ImageConstant.orientationIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
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
                child: ListDesign(
                  onTap: () {
                    Get.toNamed(RouterName.controlProfile);
                  },
                  title: "Control Your Profile",
                  icon: ImageConstant.controlProfileIcon,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
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

// Navigation SingleTextFieldWidget Common Function
void pushSingleTextFieldScreen({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  required TextEditingController controller,
  required String hint,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SingleTextFieldWidget(
        title: title,
        onTap: onTap,
        controller: controller,
        hint: hint,
      ),
    ),
  );
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
