import 'package:flutter/material.dart';

import 'package:furniture_shopping_app/data/data.dart';
import 'package:furniture_shopping_app/data/model/productsModel.dart';
import 'package:furniture_shopping_app/widget/products_in_favorite.dart';
import 'package:furniture_shopping_app/widget/sign_button.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SignButton(
          text: 'Add all to my cart',
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Favorites',
            style: TextStyle(
                fontSize: size.width / 23.4,
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
