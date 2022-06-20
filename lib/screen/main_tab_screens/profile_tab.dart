import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/screen/test.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primary,size:20, ),
        elevation: 0,
 backgroundColor: Colors.white,
        leading: IconButton(splashRadius:17,
          icon: Icon(Icons.search),onPressed: (){},),
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: primary),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: (){}, icon: Icon(Icons.follow_the_signs_rounded))
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 43,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                SizedBox(width: 20,),

                Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Bruno Pham",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "NunitoSans-Bold"),),
                  SizedBox(height: 8,),
                  Text("bruno203@gmail.com",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: disabledButton))
                ],)

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: sectionCards(title: "My Order",note:"Alerady have 10 order",onPressed: (){} ),
            ),
            sectionCards(title: "Shipping Addresses", note: "03 Addresses",onPressed: (){

            }),
            sectionCards(title: "Payment Method", note: "You have 2 cards",onPressed: (){}),
            sectionCards(title: "My reviews", note: "Reviews for 5 items",onPressed: (){}),
            sectionCards(title: "Setting", note: "Notification, Password, FAQ, Contact",onPressed: (){})
          ],
        ),
      )
    );
    
  }

  Container sectionCards({required String title,required String note,required VoidCallback onPressed }) {
    return Container(
            padding: EdgeInsets.only(right: 10,left: 20,top: 18,bottom: 17),
            margin: EdgeInsets.only(top: 15),
           decoration: BoxDecoration(
             color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 1,
               
                
              )
            ]
           ),
            width: double.infinity,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,fontFamily: "NunitoSans-Bold")),
                SizedBox(height: 5,),
                Text("Alerady have 10 order",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontFamily: "NunitoSans",color: disabledButton))
                ],
              ),
             IconButton(
          
              onPressed: onPressed, icon:  Icon(Icons.arrow_forward_ios),iconSize: 24, )             ],),
          );
  }
}