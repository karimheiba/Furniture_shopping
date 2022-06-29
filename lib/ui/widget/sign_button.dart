import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/core/constans/colors.dart';

class SignButton extends StatelessWidget {
  const SignButton({Key? key, required this.text, required this.onPressed, required this.buttonHight,required this.buttonWidth,this.visualDensity=VisualDensity.comfortable,this.color=primary})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final double buttonHight;
  final double buttonWidth;
  final VisualDensity visualDensity;
  final Color color;


  // all / 23.74 hight
  // all / 4.15 width
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return MaterialButton(
      visualDensity: visualDensity,
      onPressed: onPressed,
      
      shape: RoundedRectangleBorder( side: BorderSide(width: 1,color: primary) ,
        
          borderRadius: BorderRadius.circular(all / 118.7)),
      textColor: secondaryButtonBG,
      minWidth: buttonWidth,
      height:buttonHight,
      color: color,
      child: Text(
        text,
        style: TextStyle(
            fontSize: all / 65.95,
            fontWeight: FontWeight.w600,
            fontFamily: "NunitoSans",
            color: color==primary? Colors.white:primary
            ),
      ),
    );
  }
}
