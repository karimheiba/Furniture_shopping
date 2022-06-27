import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';
import 'package:furniture_shopping_app/ui/screen/boarding.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';
import 'package:furniture_shopping_app/ui/screen/login_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';
import 'package:furniture_shopping_app/ui/screen/my_card.dart';
import 'package:furniture_shopping_app/ui/screen/signup_screen.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/order_screen.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    AuthRepoImpl? authRepo;
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (context) => Boarding());

      case logInScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => AuthBloc(authRepo: authRepo!),
                  child: const LoginScreen(),
                ));
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => AuthBloc(authRepo: authRepo!),
                  child: const SignUpScreen(),
                ));

      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case myCardScreen:
        return MaterialPageRoute(builder: (context) => const MyCard());

      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case ordersScreen:
        return MaterialPageRoute(builder: (context) => OrderScreen());
    }
  }
}
