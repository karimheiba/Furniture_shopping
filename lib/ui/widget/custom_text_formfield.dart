import 'package:flutter/material.dart';

import '../../core/constans/colors.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({Key? key, required this.label,this.obscureText=false,this.showSuffix=false})
      : super(key: key);
  final String label;
  bool obscureText;
  bool showSuffix;
 

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: textSecondary,fontFamily: "NunitoSans"),
          labelStyle: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: textSecondary,fontFamily: "NunitoSans"),
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          label: Text(widget.label),
          suffixIcon: widget.showSuffix? IconButton(onPressed: (){
            setState(() {
              widget.obscureText= !widget.obscureText;
            });

          }, icon:  Icon( widget.obscureText? Icons.remove_red_eye_outlined: Icons.visibility_off,size: 18,color: primary)):null
          
  
      ),
      );
   
  }
}
