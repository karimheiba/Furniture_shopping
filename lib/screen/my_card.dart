import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widgetFloatingActionbutton(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            //size: MySize.customSize.gitSize(context, 20),
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Card',
          style: TextStyle(
              fontSize: MySize.customSize.gitSize(context, 16),
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }

  widgetFloatingActionbutton(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: MySize.customSize.gitSize(context, 30),
      ),
      margin: EdgeInsetsDirectional.only(
          bottom: MySize.customSize.gitSize(context, 157),
          start: MySize.customSize.gitSize(context, 20),
          end: MySize.customSize.gitSize(context, 20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          MySize.customSize.gitSize(context, 15),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              spreadRadius: 1,
              offset: Offset(0, 0))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Enter your promo code',
              ),
            ),
          ),
          SignButton(
            visualDensity: VisualDensity.standard,
            buttonHight: MySize.customSize.gitSize(context, 44),
            buttonWidth: MySize.customSize.gitSize(context, 44),
            text: '<',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
