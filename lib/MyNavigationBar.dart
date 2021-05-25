import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/Models/NavItem.dart';
import 'package:food_app/Page/HomePage/HomeScreen.dart';
import 'package:food_app/constart.dart';
import 'package:food_app/size_config.dart';
import 'package:provider/provider.dart';

import 'Page/ProfilePage/profile_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
        builder: (context, navItems, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -7),
                    blurRadius: 30,
                    color: Color(0xFF4B1A39).withOpacity(0.2))
              ]),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    navItems.items.length,
                    (index) => buildIconButton(
                        icon: navItems.items[index].icon,
                        press: () {
                          navItems.changedNavIndex(index: index);
                          if (navItems.items[index].destinationChecker()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        navItems.items[index].destination));
                          }
                        },
                        isActive:
                            navItems.currentIndex == index ? true : false),
                  ),
                ),
              ),
            ));
  }

  IconButton buildIconButton(
      {String icon, Function press, bool isActive = false}) {
    return IconButton(
      icon: SvgPicture.asset(
        icon,
        height: 22,
        color: isActive ? kPrimaryColor : Color(0xFFD1D4D4),
      ),
      onPressed: press,
    );
  }
}

class NavItems extends ChangeNotifier {
  int currentIndex = 0;

  void changedNavIndex({int index}) {
    currentIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(id: 1, icon: "icons/home.svg", destination: HomeScreen()),
    NavItem(id: 2, icon: "icons/list.svg"),
    NavItem(id: 3, icon: "icons/camera.svg"),
    NavItem(id: 4, icon: "icons/chef_nav.svg"),
    NavItem(id: 5, icon: "icons/user.svg",destination: ProfileScreen()),
  ];
}
