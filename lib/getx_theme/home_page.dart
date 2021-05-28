import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String language;

  @override
  void initState() {
    super.initState();

    language = '中文';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello".tr),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text('changeLang'.trParams({'language': language.tr})),
            alignment: Alignment.centerLeft,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    var locale = Locale('en', 'US');
                    Get.updateLocale(locale);
                    setState(() {
                      language = 'english'.tr;
                    });
                  },
                  child: Text('english'.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    var locale = Locale('de', 'DE');
                    Get.updateLocale(locale);
                    setState(() {
                      language = 'german'.tr;
                    });
                  },
                  child: Text('german'.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    var locale = Locale('zh', 'CN');
                    Get.updateLocale(locale);
                    setState(() {
                      language = 'chinese'.tr;
                    });
                  },
                  child: Text('chinese'.tr),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Text('changeTheme'.tr),
            alignment: Alignment.centerLeft,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  },
                  child: Text('system'.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.changeTheme(themeData(context));
                  },
                  child: Text('light'.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.changeTheme(darkThemeData(context));
                  },
                  child: Text('dark'.tr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

