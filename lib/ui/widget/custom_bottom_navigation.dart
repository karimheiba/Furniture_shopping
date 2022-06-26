// import 'package:flutter/material.dart';
// import 'package:furniture_shopping_app/constans/colors.dart';


// class CustomNavigation extends StatefulWidget {
//    CustomNavigation({Key? key,}) : super(key: key);

//   @override
//   State<CustomNavigation> createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   int currentIndex=0;
//   final screen=[];
 
 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
        

       
//         selectedItemColor: primary,
//         unselectedItemColor: disabledButton,
//         currentIndex: currentIndex,
//         onTap: (index,){
//           setState(() {
//             currentIndex=index;
         
          
         
//           });
//         },
       
        
//         items: [
//           BottomNavigationBarItem(activeIcon:Icon(Icons.home,) ,
//             icon:Icon(Icons.home_outlined),label:"home" ),
//           BottomNavigationBarItem(
//             activeIcon: Icon(Icons.bookmark),
//             icon:Icon(Icons.bookmark_border),label:"favorite" ),
//                     BottomNavigationBarItem(activeIcon: Icon(Icons.notifications),
//                       icon:Icon(Icons.notifications_outlined),label:"notification" ),
//           BottomNavigationBarItem(activeIcon: Icon(Icons.person),
            
//             icon:Icon(Icons.person_outline),label:"profile" ),
           


//       ],
//       ),
//     );
    
//   }
// }