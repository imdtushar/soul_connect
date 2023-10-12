import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:soul_connect/app/modules/chat/chat_screen.dart';
import 'package:soul_connect/app/modules/main/views/bottom_lib.dart';
import 'package:soul_connect/app/modules/matches/matches_screen.dart';
import 'package:soul_connect/app/modules/other_view/other_view.dart';
import 'package:soul_connect/app/modules/profile/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/main/controllers/main_controller.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  MainView({super.key});

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget vBuilder(BuildContext context, controller) {
    // TODO: implement vBuilder
    return Scaffold(
      body: PageView.builder(
        controller: controller.navController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPageOnSelectedMenuPageView(index);
        },
      ),
      extendBody: true,
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Widget getPageOnSelectedMenuPageView(int menuCode) {
    switch (menuCode) {
      case 0:
        return controller.homeView;
      case 1:
        controller.wishListView ??= KeepAlivePage(child: MatchesScreen());
        return controller.wishListView!;
      case 2:
        controller.chatView ??= KeepAlivePage(child: ChatScreen());
        return controller.chatView!;
      case 3:
        controller.profileView ??= KeepAlivePage(child: ProfileScreen());
        return controller.profileView!;
      default:
        return OtherView(
          viewParam: describeEnum(menuCode),
        );
    }
  }

  Widget buildMyNavBar(BuildContext context) {
    return SalomonBottomBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        backgroundColor: AppColors.white,
        currentIndex: controller.navController.selectedIndex,
        selectedColorOpacity: 1,
        onTap: (index) {
          controller.navController.updateSelectedIndex(index);
          controller.navController.pageController.jumpToPage(index);

          controller.update();
        },
        items: [
          SalomonBottomBarItem(
            activeIcon: Image.asset(
              "assets/images/home_icon.png",
              color: AppColors.white,
              height: 20.w,
              width: 20.w,
            ),
            icon: Image.asset(
              "assets/images/home_icon.png",
              color: AppColors.black,
              height: 20.w,
              width: 20.w,
            ),
            title: Text(
              'Home',
              style: poppinsSemiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
            selectedColor:AppColors.black,
          ),
          SalomonBottomBarItem(
            activeIcon: Image.asset(
              "assets/images/wishList_ic.png",
              color: AppColors.white,
              height: 20.w,
              width: 20.w,
            ),
            icon: Image.asset(
              "assets/images/wishList_ic.png",
              color: AppColors.black,
              height: 20.w,
              width: 20.w,
            ),
            title: Text(
              'WishList',
              style: poppinsSemiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
            selectedColor: AppColors.black,
          ),
          SalomonBottomBarItem(
            icon: Container(
              height: 45.w,
              width: 45.w,
              decoration: const BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SalomonBottomBarItem(
            activeIcon: Image.asset(
              "assets/images/chat_ic.png",
              color: AppColors.white,
              height: 20.w,
              width: 20.w,
            ),
            icon: Image.asset(
              "assets/images/chat_ic.png",
              color: AppColors.black,
              height: 20.w,
              width: 20.w,
            ),
            title: Text(
              'Chats',
              style: poppinsSemiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
            selectedColor: AppColors.black,
          ),
          SalomonBottomBarItem(
            activeIcon: Image.asset(
              "assets/images/Profile_ic.png",
              color: AppColors.white,
              height: 20.w,
              width: 20.w,
            ),
            icon: Image.asset(
              "assets/images/Profile_ic.png",
              color: AppColors.black,
              height: 20.w,
              width: 20.w,
            ),
            title: Text(
              'Account',
              style: poppinsSemiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
            selectedColor: AppColors.black,
          ),
        ]);
  }
}

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
