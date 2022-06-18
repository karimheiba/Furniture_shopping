import 'package:flutter/material.dart';

class MySize {
  num? all; 
  gitSize(BuildContext context,) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
   double all = height + width;
  }
}
