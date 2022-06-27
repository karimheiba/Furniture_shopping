import 'package:flutter/material.dart';
import '../../core/constans/colors.dart';

class CustomTextFormField extends StatefulWidget {
   CustomTextFormField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.showSuffix = false,
      required this.onSaved})
      : super(key: key);
  final String label;
  bool obscureText;
  bool showSuffix;
  final ValueSetter onSaved;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    //TODO Transfer the InputDecoration to theme file.
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primary),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: textSecondary,
            fontFamily: "NunitoSans",
          ),
          labelStyle: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: textSecondary,
            fontFamily: "NunitoSans",
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          label: Text(widget.label),
          suffixIcon: widget.showSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Icon(
                    widget.obscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off,
                    size: 18,
                    color: primary,
                  ),
                )
              : null),
      onSaved: widget.onSaved,
    );
  }
}
