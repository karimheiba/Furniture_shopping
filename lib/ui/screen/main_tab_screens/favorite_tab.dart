import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/ui/widget/products_in_favorite.dart';

import '../../../business_logic/blocs/bloc/user_bloc.dart';
import '../../widget/sign_button.dart';

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
    return BlocProvider.value(
      value: BlocProvider.of<UserBloc>(context),
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
                  Navigator.pushNamed(context, myCardScreen,
                      arguments: context.read<UserBloc>());
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
          )),
    );
  }
}
