import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("My reviews"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: reviewCard(),
    );
  }

  Container reviewCard(
      {String? image,
      String? productsName,
      String? price,
      String? Date,
      String? reviewText,
      int? index}) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: .1,
              blurRadius: 1,
              offset: Offset(1, 1)),
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Image(
                  image: AssetImage("assets/images/coffe.png"),
                  fit: BoxFit.fill,
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coffe Table",
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "NunitoSans-Bold",
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Text("\$ 50.00",
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "NunitoSans-Bold",
                      )),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber[400],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[400],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber[400],
                    ),
                  ],
                ),
                Text("12/11/2022",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NunitoSans-Bold",
                    ))
              ],
            ),
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NunitoSans",
                  ),
                  text:
                      "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price"))
        ],
      ),
    );
  }
}
