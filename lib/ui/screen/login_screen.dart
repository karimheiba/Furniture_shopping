import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';

import 'package:furniture_shopping_app/ui/widget/custom_text_formfield.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    print(all);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
                child: logoScection(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: welcomeSection(),
              ),
              fieldSection(context)
            ],
          ),
        ),
      ),
    );
  }

  Container fieldSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.only(left: 30, top: 38),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          blurRadius: 9,
          spreadRadius: .3,
        )
      ], color: Colors.white, shape: BoxShape.rectangle),
      child: Column(
        children: [
          CustomTextFormField(
            label: "Email",
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            showSuffix: true,
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            "Forgot password",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: primary,
                fontFamily: "NunitoSans"),
          ),
          const SizedBox(
            height: 40,
          ),
          SignButton(
            buttonHight: 50,
            buttonWidth: 285,
            text: "Log in",
            onPressed: () {
              Navigator.pushNamed(context, homeScreen);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, signUpScreen);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: primary,
                    fontFamily: "NunitoSans"),
              )),
          const SizedBox(
            height: 37,
          )
        ],
      ),
    );
  }

  Column welcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello !",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: textSecondary),
        ),
        Text("WELCOME BACK",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 2)),
      ],
    );
  }

  Row logoScection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 105,
          height: 2,
          color: strokeDivider,
        ),
        Container(
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primary, width: 1),
          ),
          child: Image(image: AssetImage("assets/images/logo.png")),
        ),
        Container(
          width: 105,
          height: 2,
          color: strokeDivider,
        ),
      ],
    );
  }
}
