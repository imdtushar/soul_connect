import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:soul_connect/app/core/model/page_state.dart';
import 'package:soul_connect/app/core/widget/loading.dart';
import 'package:soul_connect/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  BaseView({
    Key? key, // Make sure 'key' is defined here as well if needed
  }) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  ThemeData get appTheme => Theme.of(Get.context!);

  Widget vBuilder(BuildContext context, Controller controller);

  // PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   child: Expanded(child: Column(
    //     children: [
    //       Expanded(child: pageContent(context)),
    //     ],
    //   )),
    // );
    // return GestureDetector(
    //   child: Material( color: Colors.transparent,child:  Stack(
    //     children: [
    //       pageContent(context),
    //     ],
    //   ),),
    // );

    // return Scaffold(body: pageContent(context),);

    return GetBuilder<Controller>(
      builder: (controller) {
        return GestureDetector(
          child: Stack(
            children: [
              annotatedRegion(context, controller),
              Obx(() => controller.pageState == PageState.LOADING
                  ? _showLoading()
                  : Container()),
              Obx(() => controller.errorMessage.isNotEmpty
                  ? showErrorSnackBar(controller.errorMessage)
                  : Container()),
              Container(),
            ],
          ),
        );
      },
    );
  }

  Widget annotatedRegion(BuildContext context, controller) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context, controller),
      ),
    );
  }

  Widget pageScaffold(BuildContext context, controller) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      // appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context, controller),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context, controller) {
    return SafeArea(
      child: vBuilder(context, controller),
    );
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  Color pageBackgroundColor() {
    return Colors.white;
  }

  Color statusBarColor() {
    return appTheme.canvasColor;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }
}
