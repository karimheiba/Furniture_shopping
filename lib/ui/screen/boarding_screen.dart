import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';

class BoardingScreen extends StatelessWidget {
  BoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MySize.customSize.gitSize(context, 25),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/maskGroup.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            margin:
                EdgeInsets.only(top: MySize.customSize.gitSize(context, 80)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MAKE YOUR",
                      style: TextStyle(
                          fontSize: MySize.customSize.gitSize(context, 24),
                          fontWeight: FontWeight.w600,
                          color: textSecondary),
                    ),
                    SizedBox(
                      height: MySize.customSize.gitSize(context, 15),
                    ),
                    Text(
                      "HOME BEAUTIFUL",
                      style: TextStyle(
                          fontSize: MySize.customSize.gitSize(context, 30),
                          fontWeight: FontWeight.w700,
                          color: primary),
                    ),
                  ],
                ),
                Flexible(
                  child: SizedBox(
                    height: MySize.customSize.gitSize(context, 35),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The best simple place where you",
                        style: TextStyle(
                            fontSize: MySize.customSize.gitSize(context, 18),
                            fontWeight: FontWeight.w400,
                            color: textSecondary,
                            fontFamily: "NunitoSans"),
                      ),
                      SizedBox(
                        height: MySize.customSize.gitSize(context, 12),
                      ),
                      Text(
                        "discover most wonderful furnitures",
                        style: TextStyle(
                            fontSize: MySize.customSize.gitSize(context, 18),
                            fontWeight: FontWeight.w400,
                            color: textSecondary,
                            fontFamily: "NunitoSans"),
                      ),
                      SizedBox(
                        height: MySize.customSize.gitSize(context, 12),
                      ),
                      Text(
                        "and make your home beautiful",
                        style: TextStyle(
                            fontSize: MySize.customSize.gitSize(context, 18),
                            fontWeight: FontWeight.w400,
                            color: textSecondary,
                            fontFamily: "NunitoSans"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SizedBox(
                        height: MySize.customSize.gitSize(context, 5))),
                Column(
                  children: [
                    Center(
                      child: MaterialButton(
                        minWidth: MySize.customSize.gitSize(context, 159),
                        height: MySize.customSize.gitSize(context, 54),
                        color: primary,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, logInScreen);
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: MySize.customSize.gitSize(context, 18),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.customSize.gitSize(context, 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

// The best simple place where you discover most wonderful furnitures and make your home beautiful