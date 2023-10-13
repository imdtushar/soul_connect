import 'package:soul_connect/app/modules/auth/create_new_password/new_password_screen.dart';
import 'package:soul_connect/app/modules/auth/create_new_password/new_password_screen_binding.dart';
import 'package:soul_connect/app/modules/auth/forgot_password/forgot_password_screen.dart';
import 'package:soul_connect/app/modules/auth/forgot_password/forgot_password_screen_binding.dart';
import 'package:soul_connect/app/modules/auth/login/login_screen.dart';
import 'package:soul_connect/app/modules/auth/login/login_screen_binding.dart';
import 'package:soul_connect/app/modules/auth/mobile_login/mobile_screen.dart';
import 'package:soul_connect/app/modules/auth/mobile_login/mobile_screen_binding.dart';
import 'package:soul_connect/app/modules/auth/signup/signup_screen.dart';
import 'package:soul_connect/app/modules/auth/signup/signup_screen_binding.dart';
import 'package:soul_connect/app/modules/auth/verify_otp/verify_otp_screen.dart';
import 'package:soul_connect/app/modules/auth/verify_otp/verify_otp_screen_binding.dart';
import 'package:soul_connect/app/modules/chat/chat_screen.dart';
import 'package:soul_connect/app/modules/chat/chat_screen_binding.dart';
import 'package:soul_connect/app/modules/home/home_screen.dart';
import 'package:soul_connect/app/modules/home/home_screen_binding.dart';
import 'package:soul_connect/app/modules/main/bindings/main_binding.dart';
import 'package:soul_connect/app/modules/main/views/main_view.dart';
import 'package:soul_connect/app/modules/matches/matches_screen.dart';
import 'package:soul_connect/app/modules/matches/matches_screen_binding.dart';
import 'package:soul_connect/app/modules/profile/profile_screen.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:soul_connect/app/modules/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/routes/router_name.dart';

class AppPages {
  AppPages._();

  static const initial = RouterName.splash;

  static final routes = [
    _createPage(
      RouterName.main,
      () => MainView(),
      MainBinding(),
    ),
    _createPage(
      RouterName.splash,
      () => const SplashScreen(),
    ),
    //
    //TODO Authentication
    _createPage(
      RouterName.login,
      () => LoginScreen(),
      LoginScreenBinding(),
    ),
    _createPage(
      RouterName.signup,
      () => SignupScreen(),
      SignupScreenBinding(),
    ),
    _createPage(
      RouterName.mobileLogin,
      () => MobileLoginScreen(),
      MobileLoginScreenBinding(),
    ),
    _createPage(
      RouterName.verifyOtp,
      () => VerifyOtpScreen(),
      VerifyOtpScreenBinding(),
    ),
    _createPage(
      RouterName.newPassword,
      () => NewPasswordScreen(),
      NewPasswordScreenBinding(),
    ),
    _createPage(
      RouterName.forgotPassword,
      () => ForgotPassScreen(),
      ForgotPassScreenBinding(),
    ),
    //
    //TODO HOME Screen
    _createPage(
      RouterName.home,
      () => HomeScreen(),
      HomeScreenBinding(),
    ),
    _createPage(
      RouterName.profile,
      () => ProfileScreen(),
      ProfileScreenBinding(),
    ),
    _createPage(
      RouterName.chat,
      () => ChatScreen(),
      ChatScreenBinding(),
    ),
    _createPage(
      RouterName.matches,
      () => MatchesScreen(),
      MatchesScreenBinding(),
    ),
  ];

  static GetPage _createPage(String name, Widget Function() page,
      [Bindings? binding]) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
