// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:soul_connect/app/core/values/app_colors.dart';
// import 'package:soul_connect/app/core/values/text_styles.dart';
//
// class AppBarCustome extends StatelessWidget {
//   final String title;
//   final VoidCallback ontap;
//   final VoidCallback? dialogtap;
//
//   const AppBarCustome({
//     Key? key,
//     required this.title,
//     required this.ontap,
//     this.dialogtap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             height: 40.h,
//             margin: EdgeInsets.symmetric(
//               horizontal: 6.w,
//               vertical: 8.h,
//             ),
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: InkWell(
//                     onTap: ontap,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 12.h,
//                         horizontal: 10.w,
//                       ),
//                       child: SvgPicture.asset(
//                         'assets/images/back.svg',
//                         height: 14.h,
//                         width: 16.h,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     title,
//                     style: headline5.copyWith(
//                       color: AppColors.black,
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: dialogtap != null
//                       ? InkWell(
//                           onTap: dialogtap,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12.h,
//                               horizontal: 10.w,
//                             ),
//                             child: SvgPicture.asset(
//                               'assets/images/info.svg',
//                               height: 14.h,
//                               width: 16.h,
//                             ),
//                           ),
//                         )
//                       : Container(
//                           width: 1.w,
//                         ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 1,
//             width: MediaQuery.of(context).size.width,
//             color: const Color(0xffE4E4E4),
//           ),
//         ],
//       ),
//     );
//   }
// }
