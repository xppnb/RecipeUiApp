import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constart.dart';
import 'package:food_app/size_config.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SingleChildScrollView(
      child: Column(
        children: [
          Info(
            name: "Jhon Doe",
            email: "763583484@qq.com",
            image: "images/pic.png",
          ),
          SizedBox(
            height: SizeConfig.defaultSize * 2,
          ),
          ProfileMenuItem(
            iconScr: "icons/bookmark_fill.svg",
            title: "Save Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconScr: "icons/chef_color.svg",
            title: "Save Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconScr: "icons/language.svg",
            title: "Save Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconScr: "icons/info.svg",
            title: "Save Recipes",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.iconScr,
    this.title,
    this.press,
  }) : super(key: key);

  final String iconScr, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: SafeArea(
          child: Row(
            children: [
              SvgPicture.asset(iconScr),
              SizedBox(
                width: defaultSize * 2,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: defaultSize * 1.6, color: kTextLightColor),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kTextLightColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key key,
    this.name,
    this.email,
    this.image,
  }) : super(key: key);

  final String name;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: SizeConfig.defaultSize * 24,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.defaultSize * 15,
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: defaultSize * 14,
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white, width: defaultSize * 0.8),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(this.image), fit: BoxFit.cover)),
                ),
                Text(
                  name,
                  style:
                      TextStyle(fontSize: defaultSize * 2.2, color: kTextColor),
                ),
                SizedBox(
                  height: defaultSize / 2,
                ),
                Text(
                  this.email,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xFF8492A2)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height, width, height - 80); //形成曲线
    // path.lineTo(width / 2, height);
    // path.lineTo(width, height - 80);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
