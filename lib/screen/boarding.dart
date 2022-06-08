import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/widget/custom_bottom_navigation.dart';


class Boarding extends StatefulWidget {
   Boarding({Key? key,}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigation(),
    );
      
        


    
  }
}