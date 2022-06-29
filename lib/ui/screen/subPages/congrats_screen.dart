import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SUCCESS!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              stackImage(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  '''Your order will be delivered soon.
Thank you for choosing our app!''',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NunitoSans",
                      color: textSecondary),
                ),
              ),
              SignButton(
                text: "Track your orders",
                onPressed: () {},
                buttonHight: 60,
                buttonWidth: 315,
                visualDensity: VisualDensity.standard,
              ),
              SizedBox(
                height: 25,
              ),
              SignButton(
                text: "BACK TO HOME",
                onPressed: () {},
                buttonHight: 60,
                buttonWidth: 315,
                visualDensity: VisualDensity.standard,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container stackImage() {
    return Container(
        padding: EdgeInsets.all(30),
        child: Stack(
          children: [
            Image(
              image: AssetImage(
                "assets/images/vector.png",
              ),
              color: Color.fromARGB(179, 240, 238, 238),
            ),
            Positioned(
                bottom: 0,
                top: 0,
                left: 5,
                child: Image(
                  image: AssetImage(
                    "assets/images/Group.png",
                  ),
                  color: primary,
                )),
            Positioned(
                bottom: 0,
                top: 190,
                right: 0,
                left: 0,
                child: Image(
                  image: AssetImage(
                    "assets/images/mark.png",
                  ),
                )),
          ],
        ),
        decoration: BoxDecoration(
            // color: placeHolder,
            image: DecorationImage(
          image: AssetImage(
            "assets/images/vector.png",
          ),
          fit: BoxFit.contain,
         
        )));
  }
}
