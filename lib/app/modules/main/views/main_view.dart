import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/modules/chat/chat_screen.dart';
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
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home_icon.png",
            height: 20.w,
            width: 20.w,
          ),
          label: '',
          activeIcon: Image.asset(
            "assets/images/home_icon_active.png",
            height: 20.w,
            width: 20.w,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/matches_icon.png",
            height: 20.w,
            width: 20.w,
          ),
          label: '',
          activeIcon: Image.asset(
            "assets/images/matches_icon.png",
            color: AppColors.gradientStart,
            height: 20.w,
            width: 20.w,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/chat_ic.png",
            height: 20.w,
            width: 20.w,
          ),
          label: '',
          activeIcon: Image.asset(
            "assets/images/chat_ic_active.png",
            height: 20.w,
            width: 20.w,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Profile_ic.png",
            height: 20.w,
            width: 20.w,
          ),
          label: '',
          activeIcon: Image.asset(
            "assets/images/Profile_ic_active.png",
            height: 20.w,
            width: 20.w,
          ),
        ),
      ],
      selectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: controller.navController.selectedIndex,
      backgroundColor: AppColors.white,
      unselectedItemColor: AppColors.unSelectedBottomItem,
      elevation: 0,
      onTap: (index) {
        controller.navController.updateSelectedIndex(index);
        controller.navController.pageController.jumpToPage(index);

        controller.update();
      },
    );
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
