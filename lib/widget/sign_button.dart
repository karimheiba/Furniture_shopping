import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';

class SignButton extends StatelessWidget {
  const SignButton({Key? key,required this.text,required this.onPressed}) : super(key: key);
final String text;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      visualDensity: VisualDensity.comfortable,
       onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
     
      textColor:secondaryButtonBG ,
      minWidth: 285,
      height: 50,
      color: primary,
     
    child:Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),
    ),
    );
    
    
   
    
}
}