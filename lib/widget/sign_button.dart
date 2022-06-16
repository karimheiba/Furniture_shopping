import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/constans/colors.dart';

class SignButton extends StatelessWidget {
  const SignButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return MaterialButton(
      visualDensity: VisualDensity.comfortable,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(all / 118.7)),
      textColor: secondaryButtonBG,
      minWidth: all / 4.15,
      height: all / 23.74,
      color: primary,
      child: Text(
        text,
        style: TextStyle(
            fontSize: all / 65.95,
            fontWeight: FontWeight.w600,
            fontFamily: "NunitoSans"),
      ),
    );
  }
}
