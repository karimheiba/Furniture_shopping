import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/models/cart_model.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    required String id,
    required String name,
    required String email,
    required String password,
    String phone = '',
    String city = '',
    List<CartDataModel> cartProducts = const [],
    List<ProductDataModel> favorites = const [],
    String street = '',
    String governorate = '',
    String imageUrl = '',
    required String memberSince,
    String postalCode = '',
  }) : super(
            id: id,
            name: name,
            email: email,
            password: password,
            phone: phone,
            city: city,
            cartProducts: cartProducts,
            favorites: favorites,
            street: street,
            governorate: governorate,
            imageUrl: imageUrl,
            memberSince: memberSince,
            postalCode: postalCode);

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
          cartProducts:  json['cartProducts'],
          favorites: favorites,
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
      memberSince: '',
    );
  }

  Map<String, dynamic> toJson() {
    final favorites = this
        .favorites
        .map((product) => (product as ProductDataModel).toJson())
        .toList();

    // final cartProducts = this.cartProducts.map((productMap) {
    //   return (productMap['product'] as ProductDataModel).toJson();
    // }).toList();
    final json = <String,dynamic>{
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



class UserData extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String password;
  final String governorate;
  final String city;
  final String street;
  final String postalCode;
  final String imageUrl;
  final List<ProductDataModel> favorites;
  final List<dynamic> cartProducts;
  final String memberSince;
  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
    required this.cartProducts,
    required this.favorites,
    required this.street,
    required this.governorate,
    required this.imageUrl,
    required this.memberSince,
    required this.postalCode,
  });

  UserData copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? password,
    String? governorate,
    String? city,
    String? street,
    String? postalCode,
    String? imageUrl,
    List<ProductDataModel>? favorites,
    List<dynamic>? cartProducts,
    String? memberSince,
  }) {
    return UserData(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      street: street ?? this.street,
      postalCode: postalCode ?? this.postalCode,
      imageUrl: imageUrl ?? this.imageUrl,
      favorites: favorites ?? this.favorites,
      cartProducts: cartProducts ?? this.cartProducts,
      memberSince: memberSince ?? this.memberSince,
    );
  }

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
}
