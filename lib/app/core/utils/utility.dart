import 'dart:math';
import 'package:soul_connect/app/core/values/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

abstract class AppUtility {
  /// Logger

  static void log(dynamic message, {String? tag}) {}

  /// Close any open snack bar.

  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Close any open dialog.

  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.

  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  static void closeFocus() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Show Loading Dialog

  static void showLoadingDialog({
    double? value,
    bool? barrierDismissible,
    String? message,
  }) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              constraints: BoxConstraints(
                maxWidth: 1.sw,
                maxHeight: 1.sh,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 48.r,
                    width: 48.r,
                    child: CircularProgressIndicator(
                      color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                      strokeWidth: 3.r,
                      value: value,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    message ?? 'Please wait...',
                    // style: headline5.copyWith(
                    //   fontSize: 16.sp,
                    //   color: Theme.of(Get.context!).textTheme.bodyText1!.color,
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible ?? false,
      name: 'loading_dialog',
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }

  /// Show Simple Dialog

  static void showSimpleDialog(Widget child,
      {bool barrierDismissible = false}) {
    closeSnackBar();
    closeDialog();
    Get.dialog(
      MediaQuery.removeViewInsets(
        context: Get.context!,
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 1.sh,
            maxWidth: 100.r * 6,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.r,
              horizontal: 0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Material(
                type: MaterialType.card,
                color: Theme.of(Get.context!).dialogBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.75),
      name: 'simple_dialog',
    );
  }

  /// Show SnackBar

  static void showSuccessSnackBar(String message, {int? duration}) {
    showSnackBar(message, "success", duration: duration);
  }

  static void showErrorSnackBar(String message, {int? duration}) {
    showSnackBar(message, "error", duration: duration);
  }

  static void showError(String message) {
    closeSnackBar();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: const Text(
          "Okay",
        ),
      ),
      backgroundColor: const Color(0xFF282828),
      margin: EdgeInsets.all(16.r),
      borderRadius: 15.r,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showMessage(String message) {
    closeSnackBar();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: const Text(
          "Okay",
        ),
      ),
      backgroundColor: const Color(0xFF282828),
      margin: EdgeInsets.all(16.r),
      borderRadius: 15.r,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Show BottomSheet

  static void showBottomSheet(List<Widget> children, {double? borderRadius}) {
    closeBottomSheet();
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.r,
          horizontal: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 0.r),
          topRight: Radius.circular(borderRadius ?? 0.r),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.75),
      backgroundColor: Theme.of(Get.context!).bottomSheetTheme.backgroundColor,
    );
  }

  /// Show Overlay
  static void showOverlay(Function func) {
    Get.showOverlay(
      loadingWidget: const CupertinoActivityIndicator(),
      opacityColor: Theme.of(Get.context!).bottomSheetTheme.backgroundColor!,
      opacity: 0.5,
      asyncFunction: () async {
        await func();
      },
    );
  }

  /// Show SnackBar

  static void showSnackBar(String message, String type, {int? duration}) {
    closeSnackBar();
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
          top: 8.r,
        ),
        borderRadius: 8.r,
        padding: EdgeInsets.all(16.r),
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        borderWidth: 0.r,
        messageText: Text(
          message,
          style: poppinsRegular.copyWith(
            color: const Color(0xFF282828),
            fontSize: 14.sp,
          ),
        ),
        icon: Icon(
          renderIcon(type),
          color: const Color(0xFF282828),
          size: 20.r,
        ),
        mainButton: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 8.r,
            ),
            child: const InkWell(
              onTap: closeSnackBar,
              child: Text(
                'DISMISS',
                // style: headline4.copyWith(color: const Color(0xFF282828), fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
            )),
        shouldIconPulse: false,
        backgroundColor: type == "success"
            ? const Color(0xff4CAF50).withOpacity(0.25)
            : const Color(0xFFF50606).withOpacity(0.15),
        barBlur: 24.r,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }

  /// Render Text Color
  static Color renderTextColor(String type) {
    return Theme.of(Get.context!).textTheme.bodyLarge!.color!;
  }

  /// Render Icon Color
  static Color renderIconColor(String type) {
    return Theme.of(Get.context!).textTheme.bodyLarge!.color!;
  }

  /// Render Icon
  static IconData renderIcon(String type) {
    if (type == "success") {
      return CupertinoIcons.check_mark_circled_solid;
    }

    return CupertinoIcons.info_circle_fill;
  }

  /// --------------------------------------------------------------------------

  static void printLog(message) {}

  /// Random String
  static String generateUid(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@!%&_';
    var rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        16,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  /// Random String
  static String getFullImagePath(String path) {
    // print("${AppValues.S3_ENDPOINT}/$path");
    // print("${getS3Path()}/$path");
    return "${getS3Path()}/$path";
  }

  static String bucket_name = "";
  static String region = "";
  static String secretKey = "";
  static String accessKey = "";
  static String? cloudFrontUrl;

  /// Random String
  static String getS3Path() {
    loadCredentials();
    return cloudFrontUrl ?? getS3PathForUploading();
    // return 'https://$bucket_name.s3.$region.amazonaws.com';
  }

  static String getS3PathForUploading() {
    loadCredentials();
    // return AppValues.S3_ENDPOINT;
    return 'https://$bucket_name.s3.$region.amazonaws.com';
  }

  static loadCredentials() async {
    if (bucket_name.isEmpty ||
        region.isEmpty ||
        secretKey.isEmpty ||
        accessKey.isEmpty) {
      // final box = GetStorage();
      //OPTIMIZATION TO PREVENT MULTIPLE READ FROM BOX

      // bucket_name = await SecureStorage.readSecureData(AppValues.SETTINGS_BUCKET_NAME) ?? AppValues.DEFAULT_BUCKET_NAME;
      //
      // region = await SecureStorage.readSecureData(AppValues.SETTINGS_REGION) ?? AppValues.DEFAULT_REGION;
      //
      // secretKey = await SecureStorage.readSecureData(AppValues.SETTINGS_SECRET_KEY_ID) ?? "";
      //
      // accessKey = await SecureStorage.readSecureData(AppValues.SETTINGS_ACCESS_KEY_ID) ?? "";
      //
      // cloudFrontUrl = await SecureStorage.readSecureData(AppValues.SETTINGS_CLOUD_FRONT_URL_KEY);
    }
  }

  static String getSecretKey() {
    loadCredentials();
    return secretKey;
  }

  static String getAccessKeyKey() {
    loadCredentials();
    return accessKey;
  }

  static String getBucket() {
    loadCredentials();
    return bucket_name;
  }

  static String getRegion() {
    loadCredentials();
    return region;
  }

  static String formatMeetingId(String id) {
    final meetingId = id.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "${m[1]} ${m[2]} ${m[3]}");
    return meetingId;
  }

  static multipleImagePicker(int maxLimit) async {
    var newFileList = <AssetEntity>[];
    final List<AssetEntity>? selectedImages = await AssetPicker.pickAssets(
      Get.context!,
      pickerConfig: AssetPickerConfig(
        textDelegate: const EnglishAssetPickerTextDelegate(),
        filterOptions: FilterOptionGroup(
          containsLivePhotos: true,
          imageOption: const FilterOption(),
        ),
        maxAssets: maxLimit,
        requestType: RequestType.image,
        selectedAssets: newFileList,
      ),
    );
    if (selectedImages != null) {
      return selectedImages;
    } else {
      return null;
    }
  }

  static showInfoDialog(context, String infoText) {
    // HomeController? homeController = Get.isRegistered<HomeController>() ? Get.find<HomeController>() : null;
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Dialog(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(16.r),
    //       ),
    //       insetPadding: EdgeInsets.all(20.w),
    //       backgroundColor: AppColors.white,
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
    //         child: Wrap(
    //           alignment: WrapAlignment.center,
    //           children: [
    //             Column(
    //               children: [
    //                 Text(
    //                   homeController!.appLocalization.information,
    //                   style: headline2.copyWith(
    //                     color: AppColors.black,
    //                     fontSize: 18.sp,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 SizedBox(
    //                   height: 20.h,
    //                 ),
    //                 Text(
    //                   infoText,
    //                   style: headline4.copyWith(
    //                     color: AppColors.black,
    //                     fontSize: 12.sp,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 SizedBox(
    //                   height: 20.h,
    //                 ),
    //                 InkWell(
    //                   onTap: () {
    //                     Get.back();
    //                   },
    //                   child: Container(
    //                     height: 40.h,
    //                     width: MediaQuery.of(context).size.width / 3,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(8.r),
    //                       color: AppColors.textSemibold,
    //                     ),
    //                     child: Center(
    //                       child: Text(
    //                         homeController!.appLocalization.ok,
    //                         style: headline5.copyWith(
    //                           fontSize: 16.sp,
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static handleDeepLink(Uri deepLink) async {
    // if (deepLink != null) {
    //   // final box = GetStorage();
    //   String isLoggedIn = await SecureStorage.readSecureData(AppValues.IS_LOGGED_IN) ?? '0';
    //   // bool isLoggedIn = box.read(AppValues.IS_LOGGED_IN) ?? false;
    //   if (isLoggedIn == '1') {
    //     if (deepLink.queryParameters.containsKey('type')) {
    //       String linkType = deepLink.queryParameters['type']!;
    //
    //       if (linkType == AppValues.POST_TYPE_DYNAMIC_LINK) {
    //         if (deepLink.queryParameters.containsKey('id')) {
    //           String id = deepLink.queryParameters['id']!;
    //           Get.toNamed(RouterName.singlePostView, arguments: int.parse(id));
    //         }
    //       } else if (linkType == AppValues.PROFILE_TYPE_DYNAMIC_LINK) {
    //         if (deepLink.queryParameters.containsKey('id')) {
    //           String id = deepLink.queryParameters['id']!;
    //           Get.toNamed(RouterName.otherProfile, arguments: id.toString());
    //         }
    //       }
    //     }
    //   }
    // }
  }

  Text buildTextWithLinks(String textToLink) =>
      Text.rich(TextSpan(children: linkify(textToLink)));

  static Future<void> openUrl(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  static const String urlPattern = 'https?://\\S+';
  static const String emailPattern = 'S+@S+';
  static const String phonePattern = '[d-]{9,}';
  static final RegExp linkRegExp = RegExp(
      '($urlPattern)|($emailPattern)|($phonePattern)',
      caseSensitive: false);

  static WidgetSpan buildLinkComponent(String text, String linkToOpen) =>
      WidgetSpan(
        child: InkWell(
          child: Text(
            text,
            // style: headline4.copyWith(
            //   fontSize: 12.sp,
            //   color: AppColors.blue,
            // ),
          ),
          onTap: () => openUrl(linkToOpen),
        ),
      );

  static List<InlineSpan> linkify(String text) {
    final List<InlineSpan> list = <InlineSpan>[];
    final RegExpMatch? match = linkRegExp.firstMatch(text);
    if (match == null) {
      list.add(TextSpan(text: text));
      return list;
    }

    if (match.start > 0) {
      list.add(TextSpan(text: text.substring(0, match.start)));
    }

    final String? linkText = match.group(0);
    if (linkText?.contains(RegExp(urlPattern, caseSensitive: false)) == true) {
      list.add(buildLinkComponent(linkText!, linkText));
    } else if (linkText?.contains(RegExp(emailPattern, caseSensitive: false)) ==
        true) {
      list.add(buildLinkComponent(linkText!, 'mailto:$linkText'));
    } else if (linkText?.contains(RegExp(phonePattern, caseSensitive: false)) ==
        true) {
      list.add(buildLinkComponent(linkText!, 'tel:$linkText'));
    } else {
      throw 'Unexpected match: $linkText';
    }

    list.addAll(linkify(text.substring(match.start + linkText.length)));

    return list;
  }
}
