import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/ui/screen/boarding.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';
import 'package:furniture_shopping_app/ui/screen/login_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';
import 'package:furniture_shopping_app/ui/screen/my_card.dart';
import 'package:furniture_shopping_app/ui/screen/signup_screen.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/order_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../business_logic/blocs/home/home_bloc.dart';
import 'injection_container.dart' as si;

class AppRoute {
  SharedPreferences? sharedPreferences;
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (context) => Boarding());

      // case logInScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider<AuthBloc>(
      //             create: (context) =>
      //                 AuthBloc(authRepo: si.inj(), localDataSource: si.inj()),
      //             child: const LoginScreen(),
      //           ));
      case logInScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) =>
                      AuthBloc(authRepo: si.inj(), localDataSource: si.inj()),
                  child: const SignUpScreen(),
                ));

      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => HomeBloc(
                          authRepo: si.inj(), localDataSource: si.inj())
                        ..add(HomeScreenEvent()),
                    ),
                    BlocProvider.value(
                      value: settings.arguments! as AuthBloc,
                      //child: HomeScreen(),
                    ),
                  ],
                  child: HomeScreen(),
                ));

      case myCardScreen:
        return MaterialPageRoute(builder: (context) => const MyCard());

      case profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      case ordersScreen:
        return MaterialPageRoute(builder: (context) => OrderScreen());
    }
  }
}
