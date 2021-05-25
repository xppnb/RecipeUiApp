import 'package:flutter/material.dart';
import 'package:food_app/MyNavigationBar.dart';
import 'package:provider/provider.dart';

import 'Page/HomePage/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
