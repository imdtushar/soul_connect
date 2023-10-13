import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/utils/validation_functions.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/auth/mobile_login/mobile_screen_binding.dart';
import 'package:soul_connect/app/modules/theme/app_decoration.dart';
import 'package:soul_connect/app/modules/widget/custom_button_style.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import 'package:soul_connect/app/modules/widget/custom_image_view.dart';
import 'package:soul_connect/app/modules/widget/custom_text_form_field.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class MobileLoginScreen extends BaseView<MobileLoginScreenController> {
  MobileLoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget vBuilder(BuildContext context, controller) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                color: AppColors.gray100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: CustomImageView(
                        svgPath: ImageConstant.backButton,
                        onTap: () => Get.back(),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    CustomImageView(
                      svgPath: ImageConstant.mobileLoginBg,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: height * 0.10),
                    BodyPartOfUi(controller: controller),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

//TODO Body Part Of UI
class BodyPartOfUi extends StatelessWidget {
  final MobileLoginScreenController controller;

  const BodyPartOfUi({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 20.h,
        bottom: 20.h
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Enter your mobile number',
              style: poppinsSemiBold.copyWith(
                fontSize: 25.sp,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: Text(
              'we’ll send you a verification code on the same number',
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              bottom: 4.h,
            ),
            child: Text(
              'Enter your mobile number',
              style: poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ),
          CustomTextFormField(
            isPasswordField: false,
            autofocus: false,
            controller: controller.mobileNumberController,
            hintText: "Enter your mobile number",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.phone,
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
            validator: (value) {
              if (!isValidPhone(value)) {
                return "Please enter valid phone number";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            onTap: () {
              Get.toNamed(RouterName.verifyOtp);
            },
            text: "Send",
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
            buttonTextStyle: poppinsMedium.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
