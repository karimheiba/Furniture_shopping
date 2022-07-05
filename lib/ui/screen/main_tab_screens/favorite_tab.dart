import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/ui/widget/products_in_favorite.dart';

import '../../../business_logic/blocs/cart/cart_bloc.dart';
import '../../../business_logic/blocs/favorites/favorites_bloc.dart';
import '../../../business_logic/blocs/user/user_bloc.dart';
import '../../widget/sign_button.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  List<ProductDataModel> products = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return BlocProvider<FavoritesBloc>.value(
      value: BlocProvider.of<FavoritesBloc>(context)
        ..add(GetAllProductsInFavoriteEvent()),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is UserCartState) {
            if (state.isInCart) {
              SnackBarMessage.showSuccessMessage(
                  message: 'Added To Cart', context: context);
            }
          }
        },
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SignButton(
              buttonHight: all / 23.74,
              buttonWidth: all / 3.55,
              text: 'Add all to my cart',
              onPressed: () {},
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, myCartScreen,
                        arguments: context.read<CartBloc>());
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
            body: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoriteLoading) {
                  return const LoadingWidget();
                }
                if (state is FavoriteLoaded) {
                  products = state.products;
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductsInFavorite(
                        product: products[index],
                      );
                    },
                  );
                }
                return Container();
              },
            )),
      ),
    );
  }
}
