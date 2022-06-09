import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constans/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,required this.label,this.suffixIcon}) : super(key: key);
 final String label;
 final IconData? suffixIcon;
 
 
 
  @override
  Widget build(BuildContext context) {
    return   TextFormField(

        
          decoration: InputDecoration(
   
            floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle:TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: textSecondary) ,
            
             labelStyle: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: textSecondary),
            contentPadding: EdgeInsets.symmetric(vertical: 20),
          
            
            label:Text(label) ,
            suffixIcon: Icon(suffixIcon,size: 18,),
           
            ),
        );
        
        
    
  }
}