import 'package:flutter/material.dart';



import 'package:furniture_shopping_app/ui/screen/main_tab_screens/favorite_tab.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/home_tab_screen.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/notification_tab.dart';
import 'package:furniture_shopping_app/ui/screen/main_tab_screens/profile_tab.dart';

import '../../core/constans/colors.dart';




class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key,this.currentIndex=0}) : super(key: key);
   int currentIndex=0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
        currentIndex: widget.currentIndex,
        onTap: (index,){
          setState(() {
            widget.currentIndex=index;
         
          
         
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
      body:screens[widget.currentIndex] ,
    );
    
  }
}