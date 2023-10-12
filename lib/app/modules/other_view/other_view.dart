import 'package:soul_connect/app/modules/other_view/other_controller.dart';
import 'package:flutter/material.dart';

import '/app/core/base/base_view.dart';

class OtherView extends BaseView<OtherController> {
  final String viewParam;

  OtherView({super.key, this.viewParam = ""});

  // @override
  // PreferredSizeWidget? appBar(BuildContext context) {
  //   return CustomAppBar(appBarTitleText: viewParam);
  // }

  @override
  Widget vBuilder(BuildContext context, controller) {
    // TODO: implement vBuilder
    return const Center(
      child: Text(
        'OtherView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
