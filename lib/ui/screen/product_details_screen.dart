import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/favorites/favorites_bloc.dart';

import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/ui/widget/color_pick.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';

import '../../business_logic/blocs/cart/cart_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({required this.product});
  ProductDataModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
          infoSection(),
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
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(70)),
                image: DecorationImage(
                    // image:
                    //     AssetImage("${ProductModel.product[index].imageUrl}"),
                    image: NetworkImage(widget.product.images.first),
                    fit: BoxFit.cover)),
            //  child: Image(image: AssetImage(ProductModel.product[index].imageUrl,),fit: BoxFit.cover,),
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

  Widget infoSection() {
    return BlocListener<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        if (state is UserFavoritesState) {
          if (state.isFavorite) {
            SnackBarMessage.showSuccessMessage(
                message: 'Added To Favorite', context: context);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${widget.product.price}',
                  style: const TextStyle(
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
                      counter.toString(),
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
                  //"${ProductModel.product[index].rating}",
                  '${widget.product.rate}',
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
                        color: disabledButton)),
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
                //text: ProductModel.product[index].description,
                text: widget.product.description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30),
              child: Row(
                children: [
                  MaterialButton(
                    height: 60,
                    minWidth: 60,
                    color: secondaryButtonBG,
                    padding: EdgeInsets.all(0),
                    onPressed: () => BlocProvider.of<FavoritesBloc>(context)
                        .add(AddProductToFavoriteEvent(
                            favoriteProduct: widget.product)),
                    child: Icon(Icons.bookmark_border),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: SignButton(
                        visualDensity: VisualDensity.standard,
                        buttonHight: MySize.customSize.gitSize(context, 60),
                        buttonWidth: 250,
                        text: "Add to cart",
                        onPressed: () => context.read<CartBloc>().add(
                            AddProductToCartEvent(product: widget.product))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
