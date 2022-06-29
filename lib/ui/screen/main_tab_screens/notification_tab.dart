import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/products_repo.dart';

import '../../../business_logic/blocs/products/products_bloc.dart';
import '../../../data/models/products_data_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(productsRepo: ProductsRepoImpl())
        ..add(GetAllProductsEvent()),
      // child: Scaffold(
      //   body: Center(
      //     child: Center(child: Text("Notification")),
      //   ),
      // ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                child: Text('Get All Products'),
                onPressed: () {
                  context.read<ProductsBloc>().add(GetAllProductsEvent());
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const LoadingWidget();
                }
                if (state is ProductsLoaded) {
                  final List<ProductDataModel> products = state.products;
                  //final List<String> images = [];
                  String imageUrl = '';
                  for (var image in products.first.images) {
                    imageUrl = image;
                  }
                  return Expanded(
                      child: Column(
                    children: [
                      Text('id : ${products.first.id}'),
                      Text('name : ${products.first.name}'),
                      Text('price : ${products.first.price}'),
                      Text('rate : ${products.first.rate}'),
                      Text('image : ${imageUrl}'),
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.network(products.first.images.first))
                    ],
                  ));
                }
                return Center(
                  child: Text('No Products'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
