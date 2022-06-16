import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:furniture_shopping_app/widget/category_list.dart';
import 'package:furniture_shopping_app/widget/prudact_list.dart';

import '../../constans/colors.dart';

class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,color:textSecondary ,)),
          toolbarHeight: 80,
          centerTitle: true,
          title: Column(
            children: [
              Text("Make home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: textSecondary),),
              SizedBox(height: 5,),
              Text("BEAUTIFUL",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: primary,letterSpacing: .7),),
            ],
          ),
          
    
    actions: [
    
      IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: textSecondary,size: 30,))
    ],
        ),
        body: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CategoryList(),
            ),


            // test prudact card
PrudactList()
            
          ],
        ),
    );
    
  }
}