import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/cart/cart_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/favorites/favorites_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/products/products_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/ui/screen/boarding_screen.dart';
import 'package:furniture_shopping_app/ui/screen/home_screen.dart';
import 'package:furniture_shopping_app/ui/screen/login_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';
import 'package:furniture_shopping_app/ui/screen/cart_screen.dart';
import 'package:furniture_shopping_app/ui/screen/product_details_screen.dart';
import 'package:furniture_shopping_app/ui/screen/signup_screen.dart';
import 'package:furniture_shopping_app/ui/screen/subPages/order_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../business_logic/blocs/user/user_bloc.dart';
import '../business_logic/blocs/home/home_bloc.dart';
import 'injection_container.dart ';

class AppRoute {
  SharedPreferences? sharedPreferences;
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        if (inj<LocalDataSourceImpl>().getCachedUserId() == null) {
          return MaterialPageRoute(builder: (context) => BoardingScreen());
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
                    BlocProvider<CartBloc>(
                        create: (context) =>
                            inj<CartBloc>()..add(GetAllProductsInCartEvent())),
                    BlocProvider<FavoritesBloc>(
                      create: ((context) => inj<FavoritesBloc>()),
                    ),
                    BlocProvider<CartBloc>(
                      create: ((context) => inj<CartBloc>()),
                    ),
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
                      create: ((context) => inj<UserBloc>()),
                    ),
                    BlocProvider<FavoritesBloc>(
                      create: ((context) => inj<FavoritesBloc>()),
                    ),
                    BlocProvider<CartBloc>(
                      create: ((context) => inj<CartBloc>()),
                    ),
                  ],
                  child: HomeScreen(),
                ));

      case myCartScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<CartBloc>(
                      create: (context) =>
                          inj<CartBloc>()..add(GetAllProductsInCartEvent()),
                    ),
                   
                  ],
                  child: CartScreen(),
                ));

      case profileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => inj<AuthBloc>(),
                  child: ProfileScreen(),
                ));

      case ordersScreen:
        return MaterialPageRoute(builder: (context) => OrderScreen());

      case productDetailsScreen:
        final product = settings.arguments as ProductDataModel;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    // BlocProvider<UserBloc>(
                    //   create: (context) => inj<UserBloc>(),
                    // ),
                    BlocProvider<FavoritesBloc>(
                      create: (context) => inj<FavoritesBloc>(),
                    ),
                    BlocProvider<CartBloc>(
                      create: (context) => inj<CartBloc>(),
                    ),
                  ],
                  child: ProductDetailsScreen(product: product),
                ));
    }
  }
}
