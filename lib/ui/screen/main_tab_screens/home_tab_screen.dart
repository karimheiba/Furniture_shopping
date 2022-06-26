import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/ui/widget/category_list.dart';
import 'package:furniture_shopping_app/ui/widget/prudact_list.dart';


class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: all / 49.45,
              color: textSecondary,
            )),
        toolbarHeight: all / 14.84,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Make home",
              style: TextStyle(
                  fontSize: all / 65.95,
                  fontWeight: FontWeight.w400,
                  color: textSecondary),
            ),
            SizedBox(
              height: all / 237.4,
            ),
            Text(
              "BEAUTIFUL",
              style: TextStyle(
                  fontSize: all / 59.35,
                  fontWeight: FontWeight.w700,
                  color: primary,
                  letterSpacing: .7),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: textSecondary,
                size: all / 49.45,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: all / 118.7),
            child: CategoryList(),
          ),

          // test prudact card
          PrudactList()
        ],
      ),
    );
  }
}
