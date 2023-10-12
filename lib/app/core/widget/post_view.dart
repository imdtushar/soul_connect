// import 'package:soul_connect/app/core/values/app_colors.dart';
// import 'package:soul_connect/app/core/values/text_styles.dart';
// import 'package:soul_connect/app/data/model/home_feed_model.dart';
// import 'package:soul_connect/app/modules/home/home_screen_binding.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:readmore/readmore.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'package:soul_connect/app/routes/router_name.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class PostView extends StatefulWidget {
//   HomeFeedData? homeData;
//   int? postId;
//   DateTime? postTime;
//   var controller;
//   int index;
//   PostView({
//     Key? key,
//     required this.homeData,
//     required this.postId,
//     required this.postTime,
//     required this.controller,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   State<PostView> createState() => _PostViewState();
// }
//
// class _PostViewState extends State<PostView> {
//   // late HomeScreenController homeController;
//
//   @override
//   void initState() {
//     super.initState();
//     // homeController = Get.find();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 15.w,
//         vertical: 15.h,
//       ),
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.r),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.bgShadow,
//             blurRadius: 15.r,
//             offset: const Offset(0, 0),
//           ),
//         ],
//         color: AppColors.white,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: () {
//                     Get.toNamed(RouterName.otherUserProfile,
//                         arguments: widget.homeData?.user?.id);
//                   },
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(100.r),
//                         child: widget.homeData?.user?.profilePhoto != null
//                             ? Image.network(
//                                 "${widget.homeData?.user?.profilePhoto}",
//                                 height: 34.w,
//                                 width: 34.w,
//                                 fit: BoxFit.cover,
//                               )
//                             : Container(
//                                 height: 34.w,
//                                 width: 34.w,
//                                 color: AppColors.profileCircle,
//                                 child: Center(
//                                   child: Text(
//                                     "${widget.homeData?.user?.firstName?[0].toUpperCase()}${widget.homeData?.user?.lastName?[0].toUpperCase()}",
//                                     style: poppinsSemiBold.copyWith(
//                                       fontSize: 14.sp,
//                                       color: AppColors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                       SizedBox(
//                         width: 7.w,
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 right: 8.w,
//                               ),
//                               child: Text(
//                                 "${widget.homeData?.user?.firstName} ${widget.homeData?.user?.lastName}",
//                                 maxLines: 1,
//                                 softWrap: true,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: manropeBold.copyWith(
//                                   fontSize: 14.sp,
//                                   color: AppColors.text35,
//                                 ),
//                               ),
//                             ),
//                             ManropeRegularText(
//                               text: widget.postTime != null
//                                   ? timeago.format(widget.postTime!)
//                                   : "",
//                               size: 11,
//                               color: AppColors.text36,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onTap: () {
//                   Get.toNamed(RouterName.postExpertList,
//                       arguments: [widget.homeData?.categoryId]);
//                   // Get.toNamed(
//                   //     RouterName.healthExperts,
//                   //     arguments: [
//                   //       widget.homeData?.category?.id
//                   //           ?.toInt(),
//                   //       widget.homeData?.category?.title
//                   //     ]);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8.w,
//                     vertical: 5.h,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(3.r),
//                     color: HexColor(
//                         widget.homeData?.category?.primaryColor ?? '#F4F4F4'),
//                   ),
//                   child: ManropeSemiBoldText(
//                     text: "${widget.homeData?.category?.title}",
//                     size: 12,
//                     color: HexColor(
//                         widget.homeData?.category?.secondaryColor ?? '#2E2E2E'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 12.h,
//           ),
//           PoppinsSemiBoldText(
//             text: "${widget.homeData?.title}",
//             size: 18,
//             color: AppColors.black,
//           ),
//           ReadMoreText(
//             widget.homeData?.description ?? "",
//             style: poppinsRegular.copyWith(
//               color: AppColors.text37,
//               fontSize: 13.sp,
//             ),
//             trimMode: TrimMode.Line,
//             trimLines: 2,
//             trimCollapsedText: ' Read More',
//             moreStyle: poppinsSemiBold.copyWith(
//               color: AppColors.text2,
//               fontSize: 12.sp,
//             ),
//             trimExpandedText: ' Less',
//             lessStyle: poppinsSemiBold.copyWith(
//               fontWeight: FontWeight.w600,
//               color: AppColors.text2,
//               fontSize: 12.sp,
//             ),
//           ),
//           SizedBox(
//             height: 8.h,
//           ),
//           Container(
//             height: 1,
//             color: AppColors.divider,
//           ),
//           SizedBox(
//             height: 8.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       widget.controller.likePostApi(widget.postId!);
//                     },
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     child: Row(
//                       children: [
//                         widget.homeData?.isLike == true
//                             ? SvgPicture.asset(
//                                 "assets/image/like_fill.svg",
//                                 width: 16.w,
//                                 height: 14.h,
//                               )
//                             : SvgPicture.asset(
//                                 "assets/image/like.svg",
//                                 width: 16.w,
//                                 height: 14.h,
//                               ),
//                         SizedBox(
//                           width: 6.w,
//                         ),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: '${widget.homeData?.likesCounter}',
//                                 style: manropeMedium.copyWith(
//                                   fontSize: 11.sp,
//                                   color: AppColors.black,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: ' likes',
//                                 style: manropeMedium.copyWith(
//                                   fontSize: 11.sp,
//                                   color: AppColors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 18.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.toNamed(RouterName.postDetail,
//                           arguments: widget.homeData?.id);
//                     },
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           "assets/image/comment.svg",
//                           width: 16.w,
//                           height: 16.h,
//                         ),
//                         SizedBox(
//                           width: 6.w,
//                         ),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: '${widget.homeData?.commentsCounter}',
//                                 style: manropeRegular.copyWith(
//                                   fontSize: 11.sp,
//                                   color: AppColors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: ' suggestions',
//                                 style: manropeRegular.copyWith(
//                                   fontSize: 11.sp,
//                                   color: AppColors.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 18.w,
//                   ),
//                   SvgPicture.asset(
//                     "assets/image/share.svg",
//                     width: 14.w,
//                     height: 16.h,
//                   ),
//                 ],
//               ),
//               if (widget.controller.homeList[widget.index].aiSolution != null)
//                 InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () {
//                     if (widget.controller.homeList[widget.index].isExpanded) {
//                       widget.controller.homeList[widget.index].isExpanded =
//                           false;
//                       widget.controller.update();
//                     } else {
//                       widget.controller.homeList[widget.index].isExpanded =
//                           true;
//                       widget.controller.update();
//                     }
//                   },
//                   child: SvgPicture.asset(
//                     "assets/image/ai_button.svg",
//                     width: 40.w,
//                     height: 21.h,
//                   ),
//                 ),
//             ],
//           ),
//           if (widget.controller.homeList[widget.index].aiSolution != null)
//             if (widget.controller.homeList[widget.index].isExpanded)
//               Container(
//                 margin: EdgeInsets.only(top: 10.h),
//                 padding: EdgeInsets.all(10.r),
//                 decoration: BoxDecoration(
//                   color: AppColors.containerBgText,
//                   borderRadius: BorderRadius.circular(6.r),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               "assets/image/ai_logo.svg",
//                               height: 25.w,
//                               width: 25.w,
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             const ManropeBoldText(
//                               text: "AI Proposed Solution",
//                               size: 14,
//                               color: AppColors.black,
//                             ),
//                           ],
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(5.r),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4.r),
//                             color: AppColors.white,
//                           ),
//                           child: SvgPicture.asset(
//                             "assets/image/copy.svg",
//                             height: 15.w,
//                             width: 15.w,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: ReadMoreText(
//                         "${widget.homeData?.aiSolution?.solution}",
//                         style: poppinsRegular.copyWith(
//                           color: AppColors.black,
//                           fontSize: 13.sp,
//                         ),
//                         textAlign: TextAlign.start,
//                         trimMode: TrimMode.Line,
//                         trimLines: 3,
//                         trimCollapsedText: ' Read More',
//                         moreStyle: poppinsSemiBold.copyWith(
//                           color: AppColors.black,
//                           fontSize: 12.sp,
//                         ),
//                         trimExpandedText: ' Less',
//                         lessStyle: poppinsSemiBold.copyWith(
//                           color: AppColors.black,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.toNamed(RouterName.postExpertList,
//                             arguments: [widget.homeData?.categoryId]);
//                       },
//                       child: Container(
//                         height: 30.h,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6.r),
//                           color: AppColors.white,
//                         ),
//                         child: const Center(
//                           child: PoppinsMediumText(
//                             color: AppColors.text9,
//                             size: 13,
//                             text: "Do you want Expert Advice?",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         ],
//       ),
//     );
//   }
// }
