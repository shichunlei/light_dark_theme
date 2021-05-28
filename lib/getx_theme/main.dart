import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';
import 'home_page.dart';
import 'messages.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      // locale: Locale('en', 'US'),
      fallbackLocale: Locale('zh', 'CN'),
      locale: Get.deviceLocale,
      home: HomePage(),
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      enableLog: true,
      logWriterCallback: localLogWriter,
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    // pass the message to your favourite logging package here
    // please note that even if enableLog: false log messages will be pushed in this callback
    // you get check the flag if you want through GetConfig.isLogEnable
    print(text);
  }
}
