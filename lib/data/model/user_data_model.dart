import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/model/products_data_model.dart';

class UserDataModel extends Equatable {
  String id;
  String email;
  String name;
  String? phone;
  String password;
  String? governorate;
  String? city;
  String? street;
  String? postalCode;
  String? imageUrl;
  List<ProductDataModel>? favorites;
  List<Map<String, dynamic>>? cartProducts;
  String? memberSince;
   UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.phone,
    this.city,
    this.cartProducts,
    this.favorites,
    this.street,
    this.governorate,
    this.imageUrl,
    this.memberSince,
    this.postalCode,
  });

  @override
  List<Object?> get props => [
        name,
        password,
        email,
        city,
        cartProducts,
        favorites,
        memberSince,
        imageUrl,
        street,
        postalCode,
        phone,
        id,
        governorate,
      ];

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      final List<ProductDataModel> favorites = [];
      if (json['favorites'] != null) {
        final favoritesJson = json['favorites'];
        for (var product in favoritesJson) {
          favorites.add(ProductDataModel.fromJson(product));
        }
      }

      final List<Map<String, dynamic>> cartProducts = [];
      if (json['cartProducts'] != null) {
        final cartProductsJson = json['cartProducts'];
        for (var product in cartProductsJson) {
          cartProducts.add({
            'product': ProductDataModel.fromJson(product['product']),
            'count': product['count'],
          });
        }
      }
      return UserDataModel(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          password: json['memberSince'],
          memberSince: json['memberSince'],
          //cartProducts: cartProducts,
          //favorites: favorites,
          city: json['city'],
          governorate: json['governorate'],
          street: json['street'],
          phone: json['phone'],
          postalCode: json['postalCode'],
          imageUrl: json['imageUrl']);
    }
    return UserDataModel(
      id: '',
      name: '',
      email: '',
      password: '',
    );
  }

  Map<String, dynamic> toJson() {
    final favorites = this
        .favorites!
        .map((product) => (product).toJson())
        .toList();

    final cartProducts = this.cartProducts!.map((productMap) {
      return (productMap['product'] as ProductDataModel).toJson();
    }).toList();
    final json = <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'governorate': governorate,
      'city': city,
      'street': street,
      'postalCode': postalCode,
      'imageUrl': imageUrl,
      'favorites': favorites,
      'cartProducts': cartProducts,
      'memberSince': memberSince,
    };

    return json;
  }
}
