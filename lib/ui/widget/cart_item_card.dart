import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

import '../../business_logic/blocs/cart/cart_bloc.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key, required this.product, required this.quantity})
      : super(key: key);
  final ProductDataModel product;
  final int quantity;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Column(
                    children: [
                      Text(
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
                        '\$ ${product.price}',
                        style: TextStyle(
                            fontSize: all / 79.1,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          minWidth: 24,
                          height: 24,
                          color: Color(0xffE0E0E0),
                          onPressed: () {
                            context.read<CartBloc>().add(IncrementCounter(
                                product: product, count: quantity + 1));
                          },
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
// here we will change the counter

                        Text(
                          quantity.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "NunitoSans-Bold",
                              color: primary),
                        ),

                        MaterialButton(
                          padding: EdgeInsets.all(0),
                          minWidth: 24,
                          height: 24,
                          color: Color(0xffE0E0E0),
                          onPressed: () {
                            context.read<CartBloc>().add(IncrementCounter(
                                product: product,
                                count: quantity > 1 ? quantity - 1 : 1));
                          },
                          child: Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(RemoveProductFromCartEvent(product: product));
                    BlocProvider.of<CartBloc>(context)
                        .add(GetAllProductsInCartEvent());
                  },
                  child: Icon(size: all / 49.45, Icons.cancel_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
