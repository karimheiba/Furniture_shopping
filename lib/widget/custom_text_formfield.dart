import 'package:flutter/material.dart';
import '../constans/colors.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({Key? key, required this.label,this.obscureText=false,this.isVisible=true})
      : super(key: key);
  final String label;
  bool obscureText;
  bool isVisible;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isVisible,
      decoration: InputDecoration(
        
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primary)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: textSecondary),
          labelStyle: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w400, color: textSecondary),
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          label: Text(widget.label),
          suffixIcon: widget.obscureText ? IconButton(onPressed: (){
            setState(() {
              widget.isVisible=!widget.isVisible;
            });

          }, icon:  Icon( widget.isVisible? Icons.remove_red_eye_outlined:Icons.visibility_off,color: primary,size: 18,)):null
          
  
      ),
      );
   
  }
}
