import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/my_app/views/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  EnvConfig devConfig = EnvConfig(
    appName: "QuickDeals",
    baseUrl: "http://192.168.1.5:3000/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
