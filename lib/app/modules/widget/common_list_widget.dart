import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soul_connect/app/core/utils/image_constant.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/app_string.dart';
import 'package:soul_connect/app/modules/widget/custom_elevated_button.dart';
import '../../core/values/text_styles.dart';
import 'custom_button_style.dart';
import 'custom_image_view.dart';
import 'custome_page_appbar.dart';

class CommonListWidget extends StatelessWidget {
  const CommonListWidget({
    super.key,
    required this.title,
    required this.btnClick,
    required this.listPass,
  });

  final String title;
  final VoidCallback btnClick;
  final List<dynamic> listPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomPageAppBar(title: title),
            SizedBox(
              height: 10.h,
            ),
            BodyUi(dataList: listPass),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: CustomElevatedButton(
                onTap: btnClick,
                text: AppString.nextBtn,
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientOnErrorToPinkDecoration,
                buttonTextStyle: poppinsMedium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

class BodyUi extends StatefulWidget {
  final List<dynamic> dataList;

  const BodyUi({
    super.key,
    required this.dataList,
  });

  @override
  State<BodyUi> createState() => _BodyUiState();
}

class _BodyUiState extends State<BodyUi> {
  int selectedValue = 0;

  void selectIndex(int index) {
    selectedValue = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 15.h,
          bottom: 15.h,
        ),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.h,
          );
        },
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 8.w,
            ),
            decoration: BoxDecoration(
              borderRadius: selectedValue == index
                  ? BorderRadius.circular(5.r)
                  : BorderRadius.circular(0),
              color:
                  selectedValue == index ? AppColors.white : Colors.transparent,
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                selectIndex(index);
              },
              child: Row(
                mainAxisAlignment: selectedValue == index
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    "${widget.dataList[index]}",
                    style: poppinsRegular.copyWith(
                      fontSize: 15.sp,
                      color: selectedValue == index
                          ? AppColors.black
                          : AppColors.dividerColor,
                    ),
                  ),
                  if (selectedValue == index)
                    CustomImageView(
                      svgPath: ImageConstant.checkImg,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
