import 'package:flutter/material.dart';

import 'screen/product.dart';

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
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => Boarding(),
      //   "login": (context) => Login(),
      //   "signup": (context) => SignUp(),
      //   "home": (context) => HomeScreen(),
      //   "myCard": (context) => MyCard(),
      // },
      home: ProductScreen(),
      title: 'furniture shopping',
      theme: ThemeData(),
    );
  }
}
