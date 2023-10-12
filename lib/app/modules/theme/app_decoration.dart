import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBackground => const BoxDecoration(
        color: AppColors.white,
      );

  static BoxDecoration get fillGray => const BoxDecoration(
        color: AppColors.gray100,
      );

  static BoxDecoration get fillPrimaryContainer => const BoxDecoration(
        color: AppColors.white,
      );

  // Gradient decorations
  static BoxDecoration get gradientDeepOrangeAToPink => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outline => BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBlack => const BoxDecoration();

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            spreadRadius: 1.h,
            blurRadius: 1.h,
            offset: const Offset(
              0,
              -2,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.w,
        ),
      );

  static BoxDecoration get outline1 => const BoxDecoration();

  static BoxDecoration get outline2 => const BoxDecoration();
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder5 => BorderRadius.circular(
        5.r,
      );

  static BorderRadius get circleBorder60 => BorderRadius.circular(
        60.r,
      );

  // Custom borders
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.r,
      );

  static BorderRadius get roundedBorder21 => BorderRadius.circular(
        21.r,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
