import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/products/products_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/ui/screen/boarding.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';
import 'package:furniture_shopping_app/ui/screen/login_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';
import 'package:furniture_shopping_app/ui/screen/my_card.dart';
import 'package:furniture_shopping_app/ui/screen/product_details_screen.dart';
import 'package:furniture_shopping_app/ui/screen/signup_screen.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/order_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../business_logic/blocs/bloc/user_bloc.dart';
import '../business_logic/blocs/home/home_bloc.dart';
import 'injection_container.dart ';

class AppRoute {
  SharedPreferences? sharedPreferences;
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        if (inj<LocalDataSourceImpl>().getCachedUserId() == null) {
          return MaterialPageRoute(builder: (context) => Boarding());
        }
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeBloc>(
                      create: (context) =>
                          inj<HomeBloc>()..add(HomeScreenEvent()),
                    ),
                    // BlocProvider.value(
                    //   value: settings.arguments as AuthBloc,
                    // ),
                    BlocProvider<AuthBloc>(
                        create: (context) => inj<AuthBloc>()),
                        BlocProvider<UserBloc>(
                        create: (context) => inj<UserBloc>()..add(GetAllProductsInCartEvent())),
                  ],
                  child: HomeScreen(),
                ));
      case logInScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => inj<AuthBloc>(),
                  child: const LoginScreen(),
                ));
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => inj<AuthBloc>(),
                  child: const SignUpScreen(),
                ));

      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeBloc>(
                      create: (context) =>
                          inj<HomeBloc>()..add(HomeScreenEvent()),
                    ),
                    BlocProvider<ProductsBloc>(
                      create: ((context) => inj<ProductsBloc>()),
                    ),
                    BlocProvider.value(
                      value: settings.arguments as AuthBloc,
                    ),
                    BlocProvider<UserBloc>(
                      create: ((context) => inj<UserBloc>()..add(GetAllProductsInCartEvent())),
                    )
                  ],
                  child: HomeScreen(),
                ));

      case myCardScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: settings.arguments as UserBloc,
                  child: MyCard(),
                ));

      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case ordersScreen:
        return MaterialPageRoute(builder: (context) => OrderScreen());

      case productDetailsScreen:
        final product = settings.arguments as ProductDataModel;
        return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product));
    }
  }
}
