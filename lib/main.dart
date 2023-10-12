import 'package:flutter/services.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:soul_connect/app/modules/splash/splash.dart';
import 'package:soul_connect/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/routes/router_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __) => LayoutBuilder(
        builder: (context, constraints) {
          return GetMaterialApp(
            title: "Soul Connect",
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.gray100,
              appBarTheme: const AppBarTheme(color: AppColors.gray100),
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            initialRoute: RouterName.splash,
            getPages: AppPages.routes,
            defaultTransition: Transition.rightToLeftWithFade,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
