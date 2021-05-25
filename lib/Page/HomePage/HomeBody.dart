import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/Models/RecipeBundel.dart';
import 'package:food_app/constart.dart';
import 'package:food_app/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: recipeBundles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          SizeConfig.orientation == Orientation.landscape
                              ? 2
                              : 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing:
                          SizeConfig.orientation == Orientation.landscape
                              ? SizeConfig.defaultSize * 2
                              : 0,
                      childAspectRatio: 1.65),
                  itemBuilder: (context, index) => RecipeBundelCard(
                        recipeBundle: recipeBundles[index],
                        press: () {},
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundelCard({
    Key key,
    this.recipeBundle,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
        ),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    recipeBundle.title,
                    style: TextStyle(
                      fontSize: defaultSize * 2.2,
                      color: Colors.white,
                    ),
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    recipeBundle.description,
                    style: TextStyle(color: Colors.white54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  buildInfoRow(defaultSize,
                      image: "icons/pot.svg",
                      text: "${recipeBundle.recipes}   Recipes"),
                  SizedBox(
                    height: defaultSize * 1,
                  ),
                  buildInfoRow(defaultSize,
                      image: "icons/chef.svg",
                      text: " ${recipeBundle.chefs}   Chefs"),
                  Spacer(),
                ],
              ),
            )),
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                recipeBundle.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String image, String text}) {
    return Row(
      children: [
        SvgPicture.asset(image), //
        SizedBox(
          width: defaultSize,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ), //
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Indian", "Italian", "Mexican", "Chinese"];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: Container(
        margin: EdgeInsets.only(
          left: SizeConfig.defaultSize * 2,
        ),
        height: SizeConfig.defaultSize * 3.5, //35
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategoriItem(index)),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * 2,
              vertical: SizeConfig.defaultSize * 0.5),
          margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:
                  selectIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize * 1.6)),
          child: Text(
            categories[index],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    selectIndex == index ? kPrimaryColor : Color(0xFFC2C2B5)),
          )),
    );
  }
}
