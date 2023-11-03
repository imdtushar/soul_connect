import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'block_contact_binding.dart';

class BlockContact extends BaseView<BlockContactController> {
  BlockContact({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPageAppBar(title: "Block Contact", lastOption: true),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1545912452-8aea7e25a3d3?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        ),
                      ),
                      SizedBox(
                        width: 22.w,
                      ),
                      Text(
                        'Kylie Jenner',
                        style: poppinsRegular.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 28.h,
                    width: 76.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
                          AppColors.gradientStart,
                          AppColors.gradientEnd,
                        ],
                      ),
                    ),
                    child: Text(
                      'Unblock',
                      style: poppinsRegular.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
