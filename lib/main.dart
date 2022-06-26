import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';
import 'package:furniture_shopping_app/ui/screen/login.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';
import 'package:furniture_shopping_app/ui/screen/my_card.dart';
import 'package:furniture_shopping_app/ui/screen/signup.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/order_screen.dart';

import 'ui/screen/boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Boarding(),
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => HomeScreen(),
        "myCard": (context) => MyCard(),
        // "productitem":(context) => ProductScreen(),
        "order": (context) => OrderScreen(),
        "profile": (context) => ProfileScreen(),
      },
      title: 'furniture shopping',
      theme: ThemeData(),
    );
  }
}
