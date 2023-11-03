import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/widget/common_textfield.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custome_page_appbar.dart';
import 'package:soul_connect/app/routes/router_name.dart';

import '../widget/custom_button_style.dart';
import 'edit_number_screen_binding.dart';

class EditNumberScreen extends BaseView<EditNumberScreenController> {
  EditNumberScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPageAppBar(title: ""),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Text(
                'My number',
                style: poppinsSemiBold.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: CommonTextField(
                controller: controller.mobileNumberController,
                hintText: AppString.enterMobileNumber,
                isPasswordField: false,
                prefixIsImage: false,
                prefix: CountryCodePicker(
                  showDropDownButton: false,
                  onChanged: (value) {
                    controller.countryCode = value.toString();
                    controller.update();
                  },
                  padding: EdgeInsets.only(left: 6.w),
                  flagWidth: 24,
                  initialSelection: 'IN',
                  favorite: const ['+91', 'IN'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  showFlag: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                returnMsg: 'Please enter valid phone number',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Text(
                'Verified Email Address',
                style: poppinsRegular.copyWith(
                  color: AppColors.blueColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: Text(
                'we’ll send you a verification\ncode on the same number',
                style: poppinsRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.smallColorText,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomElevatedButton(
                onTap: () {
                  Get.toNamed(RouterName.verifyOtp);
                },
                text: AppString.sendBtn,
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
