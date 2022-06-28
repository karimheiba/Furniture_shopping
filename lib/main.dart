import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/core/app_route.dart';
import 'core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
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
      //   "login": (context) => LoginScreen(),
      //   "signup": (context) => SignUpScreen(),
      //   "home": (context) => HomeScreen(),
      //   "myCard": (context) => MyCard(),
      //   // "productitem":(context) => ProductScreen(),
      //   "order": (context) => OrderScreen(),
      //   "profile": (context) => ProfileScreen(),
      // },
      onGenerateRoute: AppRoute.generateRoute,
      title: 'furniture shopping',
      theme: ThemeData(),
    );
  }
}
