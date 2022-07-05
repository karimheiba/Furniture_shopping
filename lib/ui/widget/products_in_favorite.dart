import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/favorites/favorites_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/user/user_bloc.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

import '../../business_logic/blocs/cart/cart_bloc.dart';

class ProductsInFavorite extends StatelessWidget {
  const ProductsInFavorite({Key? key, required this.product}) : super(key: key);
  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 18.25),
      child: SizedBox(
        height: all / 11.87,
        child: Row(
          children: [
            Container(
              height: MySize.customSize.gitSize(context, 100),
              width: MySize.customSize.gitSize(context, 100),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/giphy.gif",
                // image:
                //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUd3U9lYcBg9LkWv-GKdL42RaLne_-5QFD-g&usqp=CAU',
                image: product.images.first,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: all / 59.35,
            ),
            Column(
              children: [
                Text(
                  // 'Coffee Chair',
                  product.name,
                  style: TextStyle(
                      fontSize: all / 79.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38),
                ),
                SizedBox(
                  height: all / 237.4,
                ),
                Text(
                  //  '\$ 20.00',
                  '\$ ${product.price}',
                  style: TextStyle(
                      fontSize: all / 79.1,
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
                  onTap: () {
                    BlocProvider.of<FavoritesBloc>(context).add(
                        RemoveProductFromFavoriteEvent(
                            favoriteProduct: product));
                            BlocProvider.of<FavoritesBloc>(context).add(
                        GetAllProductsInFavoriteEvent());
                  },
                  child: Icon(size: all / 49.45, Icons.cancel_outlined),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(AddProductToCartEvent(product: product));
                  },
                  child: Icon(size: all / 49.45, Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
