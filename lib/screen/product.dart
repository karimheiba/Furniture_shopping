import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/constans/colors.dart';
import 'package:furniture_shopping_app/widget/color_pick.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<bool> isSelected = List.generate(3, (index) => false);
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageSection(),
          const SizedBox(
            height: 25,
          ),
          infoSection()
        ],
      ),
    ));
  }

  // this section for product image and color picker

  Stack imageSection() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(left: 52),
            height: 455,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(70)),
                image: DecorationImage(
                    image: AssetImage("assets/images/item.png"),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 50,
          left: 32,
          child: Container(
            height: 40,
            width: 40,
            color: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ),
        Positioned(
            left: 20,
            top: 130,
            child: Container(
              height: 192,
              width: 64,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.1, .1),
                        spreadRadius: .03,
                        blurRadius: .3,
                        blurStyle: BlurStyle.outer)
                  ]),
              child: ColorPicker(),
            ))
      ],
    );
  }

  //this section for product description

  Padding infoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Minimal Stand",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 50",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NunitoSans-Bold",
                    color: primary),
              ),
              Row(
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    minWidth: 30,
                    color: Color(0xffE0E0E0),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 28,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${counter}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "NunitoSans",
                        color: primary),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    minWidth: 30,
                    color: Color(0xffE0E0E0),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        if (counter > 1) {
                          counter--;
                        } else {
                          return null;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      size: 28,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Color(0xffF2C94C),
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "4.5",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NunitoSans-Bold"),
              ),
              SizedBox(
                width: 20,
              ),
              Text("( 50 reviews)",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "NunitoSans",
                      color: disabledButton))
            ],
          ),
          SizedBox(
            height: 14,
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "NunitoSans",
                      color: disabledButton),
                  text:
                      "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ")),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 30),
            child: Row(
              children: [
                MaterialButton(
                  height: 60,
                  minWidth: 60,
                  color: secondaryButtonBG,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Icon(Icons.bookmark_border),
                ),
                SizedBox(width: 15,),
                SignButton(
                  visualDensity: VisualDensity.standard,
                  buttonHight:60 ,
                  buttonWidth:250 ,
                  text: "Add to cart", onPressed: (){})
              ],
            ),
          )
        ],
      ),
    );
  }
}
