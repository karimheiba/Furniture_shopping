import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';

import 'package:furniture_shopping_app/ui/screen/main_tab_screens/favorite_tab.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/home_tab_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/notification_tab.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';

import '../../business_logic/blocs/home/home_bloc.dart';
import '../../core/constans/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.currentIndex = 0}) : super(key: key);
  int currentIndex;

  List<Widget> screens = [
    HomeScreenTab(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    int iconColor = 0;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primary,
            unselectedItemColor: disabledButton,
            currentIndex: iconColor,
            onTap: (index) {
              // setState(() {
              //   widget.currentIndex = index;
              // });
              for (var s = 0; s <= screens.length; s++) {
                if (s == index) {
                  currentIndex = index;
                  iconColor = currentIndex;
                  context.read<HomeBloc>().add(
                      TabNavigateToScreenEvent(index: index, screen: screens));
                }
              }
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: "home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: "favorite",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.notifications),
                icon: Icon(Icons.notifications_outlined),
                label: "notification",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: "profile",
              ),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                //TODO Add Loading Widget
                return const LoadingWidget();
              } else if (state is HomeLoaded) {
                return screens[0];
              } else if (state is BodyHomeLoaded) {
                return screens[currentIndex];
              }
              return Container(
                child: Center(
                  child: Text('No data'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
