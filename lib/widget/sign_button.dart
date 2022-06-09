import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';

class SignButton extends StatelessWidget {
  const SignButton({Key? key,required this.text,required this.onTap}) : super(key: key);
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        height:50 ,
        width: 285,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          
        ),
        child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: secondaryButtonBG),),
      ),
    );
    
}
}