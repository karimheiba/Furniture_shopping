import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shopping_app/data/model/productsModel.dart';

class ProductsInFavorite extends StatelessWidget {
  ProductsInFavorite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;
    double a = h + w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 18.25),
      child: SizedBox(
        height: a / 11.87,
        child: Row(
          children: [
            Container(
              height: a / 11.87,
              width: a / 11.87,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/giphy.gif",
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUd3U9lYcBg9LkWv-GKdL42RaLne_-5QFD-g&usqp=CAU',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: a / 59.35,
            ),
            Column(
              children: [
                Text(
                  'Coffee Chair',
                  style: TextStyle(
                      fontSize: a / 79.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38),
                ),
                SizedBox(
                  height: a / 237.4,
                ),
                Text(
                  '& 20.00',
                  style: TextStyle(
                      fontSize: a / 79.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(size: a / 49.45, Icons.cancel_outlined),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(size: a / 49.45, Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
