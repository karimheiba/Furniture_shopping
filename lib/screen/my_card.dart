import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            size: all / 59.35,
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Card',
          style: TextStyle(
              fontSize: all / 74.1,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: all / 23.74,
            margin: EdgeInsetsDirectional.all(all / 59.35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                all / 74.1,
              ),
              // boxShadow: [BoxShadow(blurRadius: 0, spreadRadius: 0)],
            ),
            child: Row(
              children: [
                Expanded(child: TextFormField()),
                SizedBox(
                  height: all / 26.9,
                  width: all / 26.9,
                  child: SignButton(
                    visualDensity: VisualDensity.standard ,
                    buttonHight:all/23.74,
                    buttonWidth:all/3.55 ,
                    
                    text: '<', onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
