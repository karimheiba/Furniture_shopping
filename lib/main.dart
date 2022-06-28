import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/core/app_route.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/check_out.dart';
import 'core/constans/colors.dart';
import 'core/injection_container.dart' as di;
import 'ui/screen/subPages/shipping_address.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await di.init();
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
      // onGenerateRoute: AppRoute.generateRoute,

home: ShippingAddreesScreen(),
      title: 'furniture shopping',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: primary),
        iconTheme: IconThemeData(color: primary,size: 20)
        )
      ),
    );
  }
}
