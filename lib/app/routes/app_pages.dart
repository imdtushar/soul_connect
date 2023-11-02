import 'package:soul_connect/app/modules/age/age_screen.dart';
import 'package:soul_connect/app/modules/age/age_screen_binding.dart';
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
import 'package:soul_connect/app/modules/certifications/certification_screen.dart';
import 'package:soul_connect/app/modules/certifications/certification_screen_binding.dart';
import 'package:soul_connect/app/modules/chat/chat_screen.dart';
import 'package:soul_connect/app/modules/chat/chat_screen_binding.dart';
import 'package:soul_connect/app/modules/drink/drink_screen.dart';
import 'package:soul_connect/app/modules/drink/drink_screen_binding.dart';
import 'package:soul_connect/app/modules/email/email_screen.dart';
import 'package:soul_connect/app/modules/email/email_screen_binding.dart';
import 'package:soul_connect/app/modules/gender/gender_screen.dart';
import 'package:soul_connect/app/modules/gender/gender_screen_binding.dart';
import 'package:soul_connect/app/modules/home/home_screen.dart';
import 'package:soul_connect/app/modules/home/home_screen_binding.dart';
import 'package:soul_connect/app/modules/home_town/home_town_screen.dart';
import 'package:soul_connect/app/modules/home_town/home_town_screen_binding.dart';
import 'package:soul_connect/app/modules/like_to_date/like_to_date_screen.dart';
import 'package:soul_connect/app/modules/like_to_date/like_to_date_screen_binding.dart';
import 'package:soul_connect/app/modules/location/location_screen.dart';
import 'package:soul_connect/app/modules/location/location_screen_binding.dart';
import 'package:soul_connect/app/modules/main/bindings/main_binding.dart';
import 'package:soul_connect/app/modules/main/views/main_view.dart';
import 'package:soul_connect/app/modules/matches/matches_screen.dart';
import 'package:soul_connect/app/modules/matches/matches_screen_binding.dart';
import 'package:soul_connect/app/modules/notification/notification_screen.dart';
import 'package:soul_connect/app/modules/notification/notification_screen_binding.dart';
import 'package:soul_connect/app/modules/presentation/presentation_screen.dart';
import 'package:soul_connect/app/modules/presentation/presentation_screen_binding.dart';
import 'package:soul_connect/app/modules/profile/profile_screen.dart';
import 'package:soul_connect/app/modules/profile/profile_screen_binding.dart';
import 'package:soul_connect/app/modules/push_notification/push_notiification_screen.dart';
import 'package:soul_connect/app/modules/push_notification/push_notiification_screen_binding.dart';
import 'package:soul_connect/app/modules/relationship/relationship_screen.dart';
import 'package:soul_connect/app/modules/relationship/relationship_screen_binding.dart';
import 'package:soul_connect/app/modules/religion/religion_screen.dart';
import 'package:soul_connect/app/modules/religion/religion_screen_binding.dart';
import 'package:soul_connect/app/modules/setting/setting_screen.dart';
import 'package:soul_connect/app/modules/setting/setting_screen_bindng.dart';
import 'package:soul_connect/app/modules/sexual/sexual_screen.dart';
import 'package:soul_connect/app/modules/sexual/sexual_screen_binding.dart';
import 'package:soul_connect/app/modules/smoke/smoke_screen.dart';
import 'package:soul_connect/app/modules/smoke/smoke_screen_binding.dart';
import 'package:soul_connect/app/modules/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_connect/app/modules/tall/tall_screen.dart';
import 'package:soul_connect/app/modules/tall/tall_screen_binding.dart';
import 'package:soul_connect/app/modules/team_notification/team_notification_screen.dart';
import 'package:soul_connect/app/modules/team_notification/team_notification_screen_binding.dart';
import 'package:soul_connect/app/modules/work/work_screen.dart';
import 'package:soul_connect/app/modules/work/work_screen_binding.dart';
import 'package:soul_connect/app/modules/your_interests/your_interests_screen.dart';
import 'package:soul_connect/app/modules/your_interests/your_interests_screen_binding.dart';
import 'package:soul_connect/app/modules/your_self/your_self_screen.dart';
import 'package:soul_connect/app/modules/your_self/your_self_screen_binding.dart';
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
      RouterName.yourSelf,
      () => YourSelfScreen(),
      YourSelfScreenBinding(),
    ),
    _createPage(
      RouterName.sexualScreen,
      () => SexualScreen(),
      SexualScreenBinding(),
    ),
    _createPage(
      RouterName.relationShipScreen,
      () => RelationShipScreen(),
      RelationShipScreenBinding(),
    ),
    _createPage(
      RouterName.presentation,
      () => PresentationScreen(),
      PresentationScreenBinding(),
    ),
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
    _createPage(
      RouterName.age,
      () => AgeScreen(),
      AgeScreenBinding(),
    ),
    _createPage(
      RouterName.likeToDate,
      () => LikeToDateScreen(),
      LikeToDateBinding(),
    ),
    _createPage(
      RouterName.homeTownScreen,
      () => HomeTownScreen(),
      HomeTownScreenBinding(),
    ),
    _createPage(
      RouterName.workScreen,
      () => WorkScreen(),
      WorkScreenBinding(),
    ),
    _createPage(
      RouterName.certification,
      () => CertificationScreen(),
      CertificationBinding(),
    ),
    _createPage(
      RouterName.religion,
      () => ReligionScreen(),
      ReligionBinding(),
    ),
    _createPage(
      RouterName.smoke,
      () => SmokeScreen(),
      SmokeBinding(),
    ),
    _createPage(
      RouterName.drink,
      () => DrinkScreen(),
      DrinkBinding(),
    ),
    _createPage(
      RouterName.yourInterest,
      () => YourInterestScreen(),
      YourInterestBinding(),
    ),
    _createPage(
      RouterName.gender,
      () => GenderScreen(),
      GenderBinding(),
    ),
    _createPage(
      RouterName.location,
      () => LocationScreen(),
      LocationBinding(),
    ),
    _createPage(
      RouterName.tall,
      () => TallScreen(),
      TallScreenBinding(),
    ),
    _createPage(
      RouterName.setting,
      () => SettingScreen(),
      SettingScreenBinding(),
    ),
    _createPage(
      RouterName.notification,
      () => NotificationScreen(),
      NotificationScreenBinding(),
    ),
    _createPage(
      RouterName.email,
      () => EmailScreen(),
      EmailScreenBinding(),
    ),
    _createPage(
      RouterName.pushNotification,
      () => PushNotificationScreen(),
      PushNotificationScreenBinding(),
    ),
    _createPage(
      RouterName.teamNotification,
      () => TeamNotificationScreen(),
      TeamNotificationScreenBinding(),
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
