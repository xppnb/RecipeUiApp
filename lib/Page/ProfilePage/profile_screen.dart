import 'package:flutter/material.dart';
import 'package:food_app/MyNavigationBar.dart';
import 'package:food_app/Page/ProfilePage/ProfileBody.dart';
import 'package:food_app/constart.dart';
import 'package:food_app/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.defaultSize * 1.6,
                    fontWeight: FontWeight.bold),
              ))
        ],
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: ProfileBody(),
    );
  }
}
