import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:light_dark_theme/models/my_theme_provider.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we have to call this on our starting page
    SizeConfig().init(context);
    return Scaffold(appBar: buildAppBar(context), body: Body());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/Settings.svg",
                color: Theme.of(context).iconTheme.color),
            onPressed: () {}),
        actions: [
          IconButton(
              onPressed: () {
                print("模式选择");
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    builder: (BuildContext context) {
                      return Consumer<MyThemeModel>(
                          builder: (context, theme, child) {
                        return Container(
                          width: double.infinity,
                          height: 280,
                          child: Column(
                            children: [
                              Container(
                                  child: Text("模式选择"),
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  width: double.infinity),
                              ListTile(
                                  title: Text("浅色模式"),
                                  onTap: () {
                                    theme.changeMode(0);
                                    Navigator.pop(context);
                                  },
                                  selected: theme.darkMode == 0,
                                  leading: SvgPicture.asset(
                                      "assets/icons/Sun.svg",
                                      height: 18,
                                      width: 18,
                                      color: Theme.of(context).primaryColor)),
                              ListTile(
                                  title: Text("深色模式"),
                                  onTap: () {
                                    theme.changeMode(1);
                                    Navigator.pop(context);
                                  },
                                  selected: theme.darkMode == 1,
                                  leading: SvgPicture.asset(
                                      "assets/icons/Moon.svg",
                                      height: 18,
                                      width: 18,
                                      color: Theme.of(context).primaryColor)),
                              ListTile(
                                  title: Text("跟随系统"),
                                  onTap: () {
                                    theme.changeMode(2);
                                    Navigator.pop(context);
                                  },
                                  selected: theme.darkMode == 2,
                                  leading: Icon(Icons.settings,
                                      size: 20,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        );
                      });
                    },
                    context: context);
              },
              icon: Container(
                  width: getProportionateScreenWidth(32),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                  child: Icon(Icons.add, color: Colors.white)))
        ]);
  }
}
