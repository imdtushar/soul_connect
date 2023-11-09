import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import '../widget/custom_button_style.dart';
import 'delete_pause_account_binding.dart';

class DeletePauseAccountScreen extends BaseView<DeletePauseAccountController> {
  DeletePauseAccountScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset('assets/images/delete_account_bg.svg'),
            ),
            Column(
              children: [
                const CustomPageAppBar(title: "Delete or pause  Account"),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Why are you\nleaving app?',
                  style: poppinsRegular.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(
                  height: 42.h,
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          "I met someone",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerLine1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          "I need a break ",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerLine1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          "I’m not happy with this app",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerLine1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          "Prefer not say",
                          style: poppinsRegular.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomElevatedButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const DialogCustom();
                          });
                      // Get.toNamed(RouterName.verifyOtp);
                    },
                    text: AppString.nextBtn,
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
          ],
        ),
      ),
    );
  }
}

class DialogCustom extends StatefulWidget {
  const DialogCustom({super.key});

  @override
  State<DialogCustom> createState() => _DialogCustomState();
}

class _DialogCustomState extends State<DialogCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 38.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Pause Account',
                  style: poppinsRegular.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Keep your account and matches without being show to others.',
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomElevatedButton(
                  width: 100.w,
                  height: 38.h,
                  onTap: () => Get.back(),
                  text: 'Pause',
                  buttonStyle: CustomButtonStyles.none,
                  decoration:
                      CustomButtonStyles.gradientOnErrorToPinkDecoration,
                  buttonTextStyle: poppinsMedium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 38.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Delete Account',
                  style: poppinsRegular.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Permanently erases your account, matches, and convos.',
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28.h,
                ),
                CustomElevatedButton(
                  width: 100.w,
                  height: 38.h,
                  onTap: () => Get.back(),
                  text: 'Delete',
                  buttonStyle: CustomButtonStyles.none,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.black,
                  ),
                  buttonTextStyle: poppinsMedium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
