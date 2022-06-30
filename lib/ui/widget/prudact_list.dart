import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

import '../../business_logic/blocs/bloc/user_bloc.dart';

class ProductsList extends StatelessWidget {
  final List<ProductDataModel> products;
  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: all / 59.35, vertical: all / 79.13),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: all / 4.69,

          // childAspectRatio:.75,
          crossAxisSpacing: all / 59.35,
          mainAxisSpacing: all / 79.13,
        ),
        //itemCount: ProductModel.product.length,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: all / 4.69,
            width: all / 7.56,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             ProductDetailsScreen(index: index)));
                Navigator.pushNamed(context, productDetailsScreen,
                    arguments: products[index]);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              // image: AssetImage(
                              //   //ProductModel.product[index].imageUrl,

                              // ),
                              image: NetworkImage(
                                products[index].images.first,
                              ),
                              fit: BoxFit.fill)),
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: all / 118.7, right: all / 118.7),
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              height: all / 39.66,
                              minWidth: all / 39.66,
                              padding: EdgeInsets.all(0),
                              color: Color.fromRGBO(188, 188, 188, 100)
                                  .withOpacity(.8),
                              onPressed: () {
                                BlocProvider.of<UserBloc>(context).add(
                                    AddProductToCartEvent(
                                        product: products[index],
                                        ));
                              },
                              child: Icon(
                                Icons.shopping_bag,
                                size: all / 59.35,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: all / 118.7,
                  ),
                  Text(
                    //ProductModel.product[index].title,
                    products[index].name,
                    style: TextStyle(
                        fontSize: all / 84.78,
                        fontWeight: FontWeight.w400,
                        color: textSecondary,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: all / 197.83,
                  ),
                  //Text("\$ ${ProductModel.product[index].price}",

                  Text('\$ ${products[index].price}',
                      style: TextStyle(
                          fontSize: all / 84.78,
                          fontWeight: FontWeight.w700,
                          color: primary,
                          fontFamily: "NunitoSans"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
