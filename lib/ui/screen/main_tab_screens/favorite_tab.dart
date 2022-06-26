import 'package:flutter/material.dart';

import '../../widget/products_in_favorite.dart';
import '../../widget/sign_button.dart';

import '../../../core/constans/size.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // MySize mySize = MySize();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SignButton(
          buttonHight:all/ 23.74 ,
          buttonWidth:all/3.55 ,
          text: 'Add all to my cart',
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "myCard");
              },
              icon: Icon(
                size: all / 59.35,
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              size: all / 59.35,
              Icons.search,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Favorites',
            style: TextStyle(
                fontSize: all / 74.1,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10,
          itemBuilder: (context, index) => ProductsInFavorite(),
        ));
  }
}
