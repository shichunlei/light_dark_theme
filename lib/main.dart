import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/my_theme_provider.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => MyThemeModel()..initThemeModel())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeModel>(builder: (context, theme, child) {
      print("object======================${theme.darkMode}");

//      return MaterialApp(
//          title: 'Analog Clock',
//          debugShowCheckedModeBanner: false,
//          theme: themeData(context),
//          darkTheme: darkThemeData(context),
//          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
//          home: HomeScreen());

      return theme.darkMode == 2
          ? MaterialApp(
              title: 'Analog Clock',
              debugShowCheckedModeBanner: false,
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: ThemeMode.system,
              home: HomeScreen())
          : MaterialApp(
              title: 'Analog Clock',
              debugShowCheckedModeBanner: false,
              theme: theme.darkMode == 0
                  ? themeData(context)
                  : darkThemeData(context),
              themeMode: theme.darkMode == 0 ? ThemeMode.light : ThemeMode.dark,
              home: HomeScreen());
    });
  }
}
