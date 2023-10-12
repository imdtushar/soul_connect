import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Gradient button style
  static BoxDecoration get gradientDeepOrangeAToPinkDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(6.r),
    gradient: const LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [
        AppColors.gradientStart,
        AppColors.gradientEnd,
      ],
    ),
  );

  static BoxDecoration get gradientDeepOrangeAToPrimaryTL6Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        gradient: const LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],
        ),
      );

  static BoxDecoration get gradientDeepOrangeAToPrimaryDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        gradient: const LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorToPinkDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        gradient: const LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],
        ),
      );

  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all(AppColors.gray100.withOpacity(0.1)),
    elevation: MaterialStateProperty.all<double>(0),
  );
}
