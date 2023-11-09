import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/email/email_screen_binding.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';

class EmailScreen extends BaseView<EmailScreenController> {
  EmailScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageAppBar(title: "Email"),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      isPasswordField: false,
                      controller: controller.emailController,
                      hintText: AppString.emailHint,
                      autofocus: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Verified Email Address',
                      style: poppinsRegular.copyWith(
                        color: AppColors.blueColor,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.w),
                child: Text(
                  "Email Notification",
                  style: poppinsSemiBold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
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
                            "New matches",
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
                              value: controller.newMatches,
                              onChanged: (value) {
                                controller.newMatches = value;
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
                            "New Massages",
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
                              value: controller.newMessage,
                              onChanged: (value) {
                                controller.newMessage = value;
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
                            "Team Soul connect",
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
                              value: controller.soulConnect,
                              onChanged: (value) {
                                controller.soulConnect = value;
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
            ],
          ),
        ),
      ),
    );
  }
}
