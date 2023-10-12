import 'dart:io';
import 'package:soul_connect/app/core/utils/utility.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


// AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

abstract class AppPermissions {

  static Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        return true;
      }

      return false;
    }
    if (status.isRestricted) {
      AppUtility.showError('Camera Permission Error');

      return false;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();

      return false;
    }

    return true;
  }

  static Future<bool> checkMicPermission() async {
    var status = await Permission.microphone.status;
    if (status.isDenied) {
      if (await Permission.microphone.request().isGranted) {
        return true;
      }

      return false;
    }
    if (status.isRestricted) {
      AppUtility.showError('Microphone Permission Error');

      return false;
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();

      return false;
    }

    return true;
  }

  static Future<bool> checkStoragePermissionStatus() async {

    if(Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release ?? "1";
      Permission permisson;

      permisson = int.parse(release) > 12 ? Permission.manageExternalStorage : Permission.storage;

      return await permisson.isGranted;
    }else{
      return await Permission.storage.isGranted;
    }

  }

  static showStoragePermissionDialog() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.all(20.w),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      "Allow Access to Files",
                      style: TextStyle(
                        color: const Color(0xff3B3B3B),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Image.asset(
                      'assets/images/files.png',
                      height: 143.w,
                      // width: 38.w,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Text(
                      "We need to request your permission to read  local files in order to load it in the app.",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Center(
                    child: Text(
                      "You need to give this permission from system settings.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff0296DD),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 13.h),
                        ),
                      ),
                      onPressed: () async {
                        Get.back();
                        Permission permisson;

                        if(Platform.isAndroid) {
                          var androidInfo = await DeviceInfoPlugin()
                              .androidInfo;
                          var release = androidInfo.version.release;
                          permisson = int.parse(release) > 12 ? Permission.manageExternalStorage : Permission.storage;
                        } else {
                          permisson = Permission.storage;
                        }
                        var _permissionStatus = await permisson.request();

                        if (_permissionStatus.isDenied) {
                          showStoragePermissionDialog();
                        } else if (_permissionStatus.isPermanentlyDenied) {
                          openAppSettings();
                        }
                      },
                      child: Text(
                        "Allow Access",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: const Color(0xff7A7A7A),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
