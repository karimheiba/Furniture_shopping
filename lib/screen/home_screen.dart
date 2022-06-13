import 'package:flutter/material.dart';



import 'package:furniture_shopping_app/screen/main_tab_screens/favorite_tab.dart';
import 'package:furniture_shopping_app/screen/main_tab_screens/home_tab_screen.dart';
import 'package:furniture_shopping_app/screen/main_tab_screens/notification_tab.dart';
import 'package:furniture_shopping_app/screen/main_tab_screens/profile_tab.dart';



import '../constans/colors.dart';




class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;

   List <Widget>screens=[
    HomeScreenTab(),

    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen()

 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        

       
        selectedItemColor: primary,
        unselectedItemColor: disabledButton,
        currentIndex: currentIndex,
        onTap: (index,){
          setState(() {
            currentIndex=index;
         
          
         
          });
        },
       
        
        items: [
          BottomNavigationBarItem(activeIcon:Icon(Icons.home,) ,
            icon:Icon(Icons.home_outlined),label:"home" ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.bookmark),
            icon:Icon(Icons.bookmark_border),label:"favorite" ),
                    BottomNavigationBarItem(activeIcon: Icon(Icons.notifications),
                      icon:Icon(Icons.notifications_outlined),label:"notification" ),
          BottomNavigationBarItem(activeIcon: Icon(Icons.person),
            
            icon:Icon(Icons.person_outline),label:"profile" ),
           


      ],
      ),
      body:screens[currentIndex] ,
    );
    
  }
}