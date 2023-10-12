import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/elevated_container.dart';
import 'glass.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GlassMorphism(
      start: 0.9,
      end: 0.6,
      child: Center(
        child: CircularProgressIndicator(),
        // child: Image.asset(
        //   'assets/images/loading.gif',
        //   height: 120.h,
        // ),
      ),
    );
  }
}
