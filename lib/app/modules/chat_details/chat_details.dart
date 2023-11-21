import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import '../../core/utils/image_constant.dart';
import '../../core/values/text_styles.dart';
import '../widget/custom_image_view.dart';
import 'chat_details_binding.dart';

class ChatDetailScreen extends BaseView<ChatDetailScreenController> {
  ChatDetailScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),

                //TODO AppBar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.backButton,
                            onTap: () => Get.back(),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: CachedNetworkImage(
                                  height: 44.w,
                                  width: 44.w,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1613323593608-abc90fec84ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                right: 0,
                                child: Container(
                                  height: 10.w,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.gradientStart,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.white,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Raj Patel",
                                style: poppinsMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                " Online",
                                style: poppinsMedium.copyWith(
                                  fontSize: 10.sp,
                                  color: AppColors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/images/more_option_vertical.svg',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),

                //TODO ChatList
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: ListView.separated(
                        reverse: true,
                        padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          var even = index.isEven;

                          if (even) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 170.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      AppColors.gradientStart,
                                      AppColors.gradientEnd,
                                    ]),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r),
                                      bottomLeft: Radius.circular(10.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Sure, let me know when you’ll be free!",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: CachedNetworkImage(
                                    height: 25.w,
                                    width: 25.w,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://images.unsplash.com/photo-1613323593608-abc90fec84ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: CachedNetworkImage(
                                    height: 25.w,
                                    width: 25.w,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://images.unsplash.com/photo-1613323593608-abc90fec84ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.white,
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  width: 170.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Sure, let me know when you’ll be free!",
                                    style: poppinsRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  if (controller.isDoc)
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.isDoc = false;
                        controller.update();
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.55,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                          child: Container(
                            height: 5.h,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (controller.isDoc)
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (controller.isDoc) {
                          controller.isDoc = true;
                        } else {
                          controller.isDoc = false;
                        }
                        controller.update();
                      },
                      child: Container(
                        height: 120.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 18.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x26000000),
                              blurRadius: 14.54.r,
                              offset: const Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Iconsax.gallery),
                                  Text(
                                    'Gallery',
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 54.w,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Iconsax.camera),
                                  Text(
                                    'Camera',
                                    style: poppinsSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            //TODO Chat Type
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  controller.isDoc = false;
                  controller.update();
                },
                child: Container(
                  height: 80.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 21.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.06),
                        spreadRadius: 1,
                        blurRadius: 8.r,
                        offset: const Offset(-2, -6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (controller.isDoc) {
                            controller.isDoc = false;
                          } else {
                            controller.isDoc = true;
                          }
                          controller.update();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(
                            'assets/images/upload_doc.svg',
                          ),
                        ),
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          autofocus: false,
                          controller: controller.sendMessage,
                          isPasswordField: false,
                          hintText: 'Start Typing',
                          maxLines: 1,
                          fillColor: AppColors.chatBgTextField,
                          filled: true,
                          borderDecoration: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/send_button.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
