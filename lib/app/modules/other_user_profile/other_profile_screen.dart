import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import '../../core/base/base_view.dart';
import '../../core/values/app_colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_button_style.dart';
import '../widget/custom_elevated_button.dart';
import 'other_profile_screen_binding.dart';

class OtherProfileScreen extends BaseView<OtherProfileScreenController> {
  OtherProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Stack(
                children: [
                  CarouselSlider(
                    disableGesture: false,
                    options: CarouselOptions(
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        height: 300.h,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayCurve: Curves.decelerate,
                        onPageChanged: (index, reason) {
                          controller.indexValue = index;
                          controller.update();
                        }),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 3.2,
                    right: MediaQuery.of(context).size.width / 3.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.white.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: controller.indexValue == entry.key
                                  ? 16.0
                                  : 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: controller.indexValue == entry.key
                                    ? AppColors.white
                                    : AppColors.white.withOpacity(0.5),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  CustomAppBar(
                    text: '',
                    showSkip: true,
                    skipOnTap: () {},
                    skipWidget: SvgPicture.asset(
                      'assets/images/more_option.svg',
                      height: 40,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 40,
                    child: SvgPicture.asset(
                      'assets/images/likeProfile.svg',
                    ),
                  )
                  //likeProfile.svg
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 21.w,
                vertical: 8.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Yash Bheda",
                            style: poppinsMedium.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          SvgPicture.asset("assets/images/verify_icon.svg"),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/direction.svg"),
                          Text(
                            "1.3 Miles away",
                            style: poppinsRegular.copyWith(
                              color: AppColors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.w,
                    width: 42.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: AppColors.gradientStart,
                            ),
                          ),
                        ),
                        Text(
                          "76%",
                          style: poppinsRegular.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.gradientStart,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 22.w,
                vertical: 10.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  //birthday_icon.svg

                  SizedBox(
                    height: 20,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/images/birthday_icon.svg",
                              height: 15,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "22",
                              style: poppinsRegular.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),

                  Row(
                    children: [
                      SvgPicture.asset('assets/images/job_icon.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Flutter Developer / Ahmedabad",
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/home_location.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Rajkot Gujarat",
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/search_long.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Long-term relationship",
                        style: poppinsRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 22.w,
                vertical: 10.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My self-summary",
                    style: poppinsSemiBold.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Et dolores quod ut dolorem magni quo ipsa nihil ut labore sunt aut alias voluptatem. Sit minima beatae et veritatis laudantium ut soluta omnis qui corrupti quod et consequatur dolores vel dicta provident. Ea accusantium aliquid hic inventore placeat et sunt unde ut iste natus.",
                    style: poppinsRegular.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return const BlockAndReport();
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    color: AppColors.gradientStart,
                  ),
                ),
                child: Text(
                  "REPORT OR BLOCK",
                  style: poppinsRegular.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.gradientStart,
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

class BlockAndReport extends StatefulWidget {
  const BlockAndReport({super.key});

  @override
  State<BlockAndReport> createState() => _BlockAndReportState();
}

class _BlockAndReportState extends State<BlockAndReport> {
  bool isReport = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            if (isReport)
              Column(
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
                          'Block',
                          style: poppinsRegular.copyWith(
                            fontSize: 25.sp,
                          ),
                        ),
                        Text(
                          'Hide you from each other',
                          style: poppinsRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomElevatedButton(
                          width: 100.w,
                          height: 32.h,
                          onTap: () => Get.back(),
                          text: 'Block',
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientOnErrorToPinkDecoration,
                          buttonTextStyle: poppinsMedium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
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
                          'Report',
                          style: poppinsRegular.copyWith(
                            fontSize: 25.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'This person violated the community guidelines you will be able to block them afterwards.',
                          style: poppinsRegular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomElevatedButton(
                          width: 100.w,
                          height: 32.h,
                          onTap: () {
                            isReport = false;
                            setState(() {});
                          },
                          text: 'Report',
                          buttonStyle: CustomButtonStyles.none,
                          decoration: CustomButtonStyles
                              .gradientOnErrorToPinkDecoration,
                          buttonTextStyle: poppinsMedium.copyWith(
                            fontSize: 14.sp,
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
              )
            else
              Column(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Make a report',
                                style: poppinsRegular.copyWith(
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  'Which best describes what happened? You can add more information before submitting your report.',
                                  style: poppinsRegular.copyWith(
                                    fontSize: 10.sp,
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            const CommonWidget(
                              text: 'Scam, fake account, or selling something',
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            const CommonWidget(
                              text: 'Report a photo',
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            const CommonWidget(
                              text: 'Inappropriate message or profile',
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            const CommonWidget(
                              text: 'In Persson harm or unsafe situation',
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.black.withOpacity(0.2),
                            ),
                            const CommonWidget(
                              text: 'Underage',
                            ),
                          ],
                        ),
                      ],
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

class CommonWidget extends StatelessWidget {
  final String text;

  const CommonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Get.back(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              text,
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
