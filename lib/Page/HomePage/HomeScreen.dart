import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/size_config.dart';

import '../../MyNavigationBar.dart';
import 'HomeBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: HomeBody(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset("icons/menu.svg"), onPressed: () {}),
      title: Image.asset("images/logo.png"),
      centerTitle: true,
      actions: [
        IconButton(
            icon: SvgPicture.asset("icons/search.svg"), onPressed: () {}),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        )
      ],
    );
  }
}


