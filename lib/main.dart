import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/screen/login.dart';

import 'screen/boarding.dart';


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
      initialRoute:"/" ,
      routes: {
"/":(context) => Boarding(),
"login":(context) => Login(),

      },
      title: 'furniture shopping',
      theme: ThemeData(
      ),
   
      );
      }
      }
