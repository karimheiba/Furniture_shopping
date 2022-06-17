import 'package:flutter/material.dart';

class MySize {
  double? all;
  gitSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    all = height + width;
  }
}
