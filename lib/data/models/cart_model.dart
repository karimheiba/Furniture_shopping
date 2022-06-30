import 'package:furniture_shopping_app/data/models/products_data_model.dart';

class CartDataModel {
  int count;
  ProductDataModel product;

  CartDataModel({required this.count, required this.product});
  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(count: json['count'], product: json['product']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'count': count,
      'product': product,
    };
    return data;
  }
}
