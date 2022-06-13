import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/constans/colors.dart';

import 'package:furniture_shopping_app/widget/custom_text_formfield.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
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
      margin: EdgeInsets.only(right: 30),
      padding: EdgeInsets.only(left: 30, top: 38),
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
          SizedBox(
            height: 25,
          ),
          CustomTextFormField(
              label: "Password",obscureText: true,showSuffix: true, ),
          SizedBox(
            height: 35,
          ),
          Text(
            "Forgot password",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: primary),
          ),
          SizedBox(
            height: 40,
          ),
          SignButton(
            text: "Log in",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
              
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "signup");
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: primary),
              )),
          SizedBox(
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
