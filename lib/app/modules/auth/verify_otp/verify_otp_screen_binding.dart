import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';

class VerifyOtpScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => VerifyOtpScreenController(),
      fenix: true,
    );
  }
}

class VerifyOtpScreenController extends BaseController  with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}