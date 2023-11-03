import 'package:soul_connect/app/core/base/base_view.dart';
import 'package:soul_connect/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'chat_screen_binding.dart';

class ChatScreen extends BaseView<ChatScreenController> {
  ChatScreen({super.key});

  @override
  Widget vBuilder(BuildContext context, controller) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(
          child: Text('Chat'),
        ),
      ),
    );
  }
}
