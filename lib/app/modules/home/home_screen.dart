import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/data/model/example_card_model.dart';
import 'home_screen_binding.dart';

class HomeScreen extends BaseView<HomeScreenController> {
  HomeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 6.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    ImageConstant.soulConnectLogo,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstant.searchIconHome,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        ImageConstant.notificationIcon,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset(
                        ImageConstant.filterHome,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              child: CardSwiper(
                controller: controller.cardController,
                cardsCount: controller.cards.length,
                onSwipe: controller.onSwipe,
                onUndo: controller.onUndo,
                numberOfCardsDisplayed: 3,
                // backCardOffset: Offset(0, 0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    controller.cards[index],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.cardController.swipeRight();
                  },
                  child: SvgPicture.asset(ImageConstant.likeBtn),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.cardController.swipeTop();
                  },
                  child: SvgPicture.asset(ImageConstant.loveBtn),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.cardController.swipeLeft();
                  },
                  child: SvgPicture.asset(ImageConstant.disLikeBtn),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: SvgPicture.asset(ImageConstant.infoBtn),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final ExampleCandidateModel candidate;

  const ExampleCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 512.h,
          decoration: ShapeDecoration(
            color: Colors.greenAccent,
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1558280417-ea782f829e93?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 4,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33302756),
                blurRadius: 30,
                offset: Offset(6, 10),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28)),
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  const Color(0x00110030),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Container(
                        height: 78.w,
                        width: 78.w,
                        padding: EdgeInsets.all(3.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.bgColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1558280417-ea782f829e93?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            height: 78.w,
                            width: 78.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Bhedu 22",
                                style: poppinsSemiBold.copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              SvgPicture.asset(ImageConstant.verifyIcon),
                            ],
                          ),
                          Text(
                            "1.5 Km away",
                            style: poppinsRegular.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.bgColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
