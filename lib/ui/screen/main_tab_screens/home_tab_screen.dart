import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/injection_container.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/products_repo.dart';
import 'package:furniture_shopping_app/ui/widget/category_list.dart';
import 'package:furniture_shopping_app/ui/widget/prudact_list.dart';

import '../../../business_logic/blocs/products/products_bloc.dart';

class HomeScreenTab extends StatelessWidget {
  HomeScreenTab({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  List<ProductDataModel> searchedProductsList = [];
  List<ProductDataModel>? productsList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double all = height + width;
    return BlocProvider(
      create: (_) => inj<ProductsBloc>()
        ..add(GetAllProductsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is IsSearchedProductState) {
                if (state.isSearched) {
                  return IconButton(
                    onPressed: () {
                      _stopSearching(context);
                      print(searchController.text);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear_outlined,
                      color: textSecondary,
                    ),
                  );
                }
              }
              return IconButton(
                onPressed: () => _startSearch(context),
                icon: const Icon(Icons.search_outlined, color: textSecondary),
              );
            },
          ),
          toolbarHeight: all / 14.84,
          centerTitle: true,
          title: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            if (state is IsSearchedProductState) {
              if (state.isSearched) {
                return _startSearch(context);
              }
            } else if (state is SearchedProductsLoaded) {
              return _startSearch(context);
            }
            return Column(
              children: [
                const Text(
                  "Make home",
                  style: TextStyle(
                      //fontSize: all / 65.95,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: textSecondary),
                ),
                SizedBox(
                  height: all / 237.4,
                ),
                const Text(
                  "BEAUTIFUL",
                  style: TextStyle(
                      // fontSize: all / 59.35,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primary,
                      letterSpacing: .7),
                ),
              ],
            );
          }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: textSecondary,
                  size: all / 49.45,
                ))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: all / 118.7,
              ),
              child: CategoryList(),
            ),

            // test prudact card
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Expanded(child: Center(child: LoadingWidget()));
                } else if (state is ProductsLoaded) {
                  productsList = state.products;
                  return ProductsList(
                    products: productsList!,
                  );
                } else if (state is CategoryProductsLoaded) {
                  return ProductsList(
                    products: state.products,
                  );
                } else if (state is SearchedProductsLoaded) {
                  searchedProductsList = state.products;
                  return ProductsList(
                    products: searchedProductsList,
                  );
                } else if (state is IsSearchedProductState) {
                  if (state.isSearched) {
                    return ProductsList(
                      products: searchedProductsList,
                    );
                  } else {
                    return ProductsList(
                      products: productsList!,
                    );
                  }
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return TextFormField(
          controller: searchController,
          onChanged: (searchedProducts) {
            context
                .read<ProductsBloc>()
                .add(GetSearchProductsEvent(productName: searchedProducts));
          },
          decoration: const InputDecoration(
            hintText: 'search here ...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: textSecondary),
          ),
          cursorColor: textSecondary,
          style: const TextStyle(
              color: textSecondary, fontSize: 18, fontWeight: FontWeight.bold),
        );
      },
    );
  }

  void _stopSearching(BuildContext context) {
    searchController.clear();
    BlocProvider.of<ProductsBloc>(context).add(CloseSearchEvent());
  }

  Widget _startSearch(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: () => _stopSearching(context)),
    );
    BlocProvider.of<ProductsBloc>(context).add(StartSearchEvent());
    return searchTextField();
  }
}
