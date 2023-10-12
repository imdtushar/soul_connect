import 'dart:io';
import 'package:soul_connect/app/core/utils/secure_storage.dart';
import 'package:soul_connect/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../modules/theme/theme_controller.dart';
import '/app/bindings/initial_binding.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '../../bindings/local_source_bindings.dart';
import '../bindings/my_app_bindings.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;
  late ThemeController _themeController;
  Locale? locale;

  @override
  void initState() {
    // initialize [LocalResourceBinding] here because
    // we need to access SharedPreferences in [MyAppController]
    LocalSourceBindings().dependencies();
    MyAppBindings().dependencies();
    _themeController = Get.find<ThemeController>();
    // getLocale();

    HttpOverrides.global = MyHttpOverrides();

    super.initState();
  }

  getLocale() async {
    final languageKey = await SecureStorage.readSecureData(AppValues.APP_LANGUAGE_KEY, defaultValue: "en");

    switch (languageKey) {
      case 'gu':
        locale = const Locale('gu', '');
        break;
      case 'hi':
        locale = const Locale('hi', '');
        break;
      default:
        locale = const Locale('en', '');
    }
  }



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => Obx(
        () => GetMaterialApp(
          title: _envConfig.appName,
          defaultTransition: Transition.leftToRight,
          initialRoute: AppPages.initial,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          // supportedLocales: _getSupportedLocal(),
          // theme: AppThemes.lightTheme,
          // locale: locale,
          // fallbackLocale: const Locale('en', ''),
          // darkTheme: AppThemes.darkTheme,
          // theme: ThemeData(
          //   primaryColor: AppColors.bgColor,
          //   useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bgColor).copyWith(background: AppColors.bgColor)
          // ),
          themeMode: _themeController.currentThemeMode.value,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
      const Locale('hi', ''),
      const Locale('gu', ''),
    ];
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
