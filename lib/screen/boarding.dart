import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/constans/size.dart';
import 'package:furniture_shopping_app/data/data.dart';

class Boarding extends StatelessWidget {
  Boarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/maskGroup.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "MAKE YOUR",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: textSecondary),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "HOME BEAUTIFUL",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: primary),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The best simple place where you",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "discover most wonderful furnitures",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "and make your home beautiful",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 10),
              child: Column(
                children: [
                  Center(
                    child: MaterialButton(
                      minWidth: MySize.customSize.gitSize(context,159 ),
                      height: MySize.customSize.gitSize(context, 54),
                      color: primary,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "login");
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            fontSize: MySize.customSize.gitSize(context, 18), fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

// The best simple place where you discover most wonderful furnitures and make your home beautiful