import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/size.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';
import 'package:furniture_shopping_app/ui/widget/cart_item_card.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';
import '../../business_logic/blocs/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: widgetFloatingActionbutton(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            //size: MySize.customSize.gitSize(context, 20),
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: TextStyle(
              fontSize: MySize.customSize.gitSize(context, 16),
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is UserCartLoading) {
            return const LoadingWidget();
          }
          if (state is Error) {
            return Column(
              children: [Text(state.message)],
            );
          }
          if (state is UserCartLoaded) {
            final list = state.cartProducts;
            return Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MySize.customSize.gitSize(context, 450),
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: CartItemCard(
                                product: list[index].product,
                                quantity: list[index].count,
                              ),
                            );
                          }),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 4,
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                  children: [Text('Total = 10')],
                ))
              ],
            );
          }
          return Container(
            color: Colors.red,
            height: 120,
          );
        },
      ),
    );
  }

  widgetFloatingActionbutton(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: MySize.customSize.gitSize(context, 30),
      ),
      margin: EdgeInsetsDirectional.only(
          bottom: MySize.customSize.gitSize(context, 157),
          start: MySize.customSize.gitSize(context, 20),
          end: MySize.customSize.gitSize(context, 20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          MySize.customSize.gitSize(context, 15),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              spreadRadius: 1,
              offset: Offset(0, 0))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Enter your promo code',
              ),
            ),
          ),
          SignButton(
            visualDensity: VisualDensity.standard,
            buttonHight: MySize.customSize.gitSize(context, 44),
            buttonWidth: MySize.customSize.gitSize(context, 44),
            text: '<',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
