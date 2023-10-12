// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:soul_connect/app/routes/router_name.dart';
//
// import 'package:soul_connect/app/core/values/text_styles.dart';
// import '/app/core/values/app_colors.dart';
// import '/app/core/values/app_values.dart';
// import '/app/modules/main/controllers/bottom_nav_controller.dart';
// import '/app/modules/main/model/menu_code.dart';
// import '/app/modules/main/model/menu_item.dart';
//
// // ignore: must_be_immutable
// class BottomNavBar extends StatelessWidget {
//   final Function(MenuCode menuCode) onNewMenuSelected;
//
//   BottomNavBar({Key? key, required this.onNewMenuSelected}) : super(key: key);
//   late AppLocalizations appLocalization;
//
//   final navController = Get.put(BottomNavController());
//
//   final Key bottomNavKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     appLocalization = AppLocalizations.of(context)!;
//
//     Color selectedItemColor = Color(0xffFF0000);
//     Color unselectedItemColor = Color(0xff1B1B1B);
//     List<BottomNavItem> navItems = _getNavItems();
//
//     return Obx(
//       () => SizedBox(
//         height: 76.h,
//         child: BottomNavigationBar(
//           key: bottomNavKey,
//           items: navItems.map(
//             (BottomNavItem navItem) {
//               return BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       SvgPicture.asset(
//                         "assets/image/${navItem.iconSvgName}",
//                         height: 20.w,
//                         width: 20.w,
//                         color: navItems.indexOf(navItem) == navController.selectedIndex ? selectedItemColor : unselectedItemColor,
//                       ),
//                       SizedBox(
//                         height: 3.h,
//                       ),
//                     ],
//                   ),
//                   label: navItem.navTitle,
//                   tooltip: "");
//             },
//           ).toList(),
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           // backgroundColor: AppColors.colorWhite,
//           selectedItemColor: selectedItemColor,
//           unselectedItemColor: unselectedItemColor,
//           currentIndex: navController.selectedIndex,
//           // selectedLabelStyle: headline5.copyWith(
//           //   fontSize: 10.sp,
//           //   color: const Color(0xff3662FF),
//           // ),
//           // unselectedLabelStyle: headline4.copyWith(
//           //   fontSize: 10.sp,
//           //   color: const Color(0xff858585),
//           // ),
//           onTap: (index) {
//             if (navItems[index].menuCode == MenuCode.CREATE) {
//               Get.toNamed(RouterName.goLive);
//             } else {
//               navController.updateSelectedIndex(index);
//               onNewMenuSelected(navItems[index].menuCode);
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   List<BottomNavItem> _getNavItems() {
//     return [
//       BottomNavItem(
//         navTitle: appLocalization.bottomNavHome,
//         iconSvgName: "home_ic.svg",
//         menuCode: MenuCode.HOME,
//       ),
//       BottomNavItem(
//         navTitle: appLocalization.bottomNavSearch,
//         iconSvgName: "search_ic.svg",
//         menuCode: MenuCode.CALL,
//       ),
//       // BottomNavItem(
//       //   navTitle: appLocalization.bottomNavLive,
//       //   iconSvgName: "live_ic.svg",
//       //   menuCode: MenuCode.GO_LIVE,
//       // ),
//       BottomNavItem(
//         navTitle: appLocalization.bottomNavInbox,
//         iconSvgName: "experts_ic.svg",
//         menuCode: MenuCode.EXPERTS,
//       ),
//       BottomNavItem(
//         navTitle: appLocalization.bottomNavProfile,
//         iconSvgName: "profile_ic.svg",
//         menuCode: MenuCode.PROFILE,
//       ),
//     ];
//   }
// }
