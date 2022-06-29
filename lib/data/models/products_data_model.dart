import 'package:equatable/equatable.dart';

import 'category_data_model.dart';

class ProductDataModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final double rate;
  final int countInStock;
  final CategoryDataModel category;
  final String brand;
  final List<String> images;
  final String color;

  const ProductDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.rate,
    required this.countInStock,
    required this.category,
    required this.brand,
    required this.images,
    required this.color,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return ProductDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] as num?)!.toDouble(),
        discount: (json['discount'] as num?)!.toDouble(),
        rate: (json['rate'] as num?)!.toDouble(),
        countInStock: (json['countInStock'] as num?)!.toInt(),
        category: CategoryDataModel.fromJson(
            json['category'] as Map<String, dynamic>?),
        brand: json['brand'],
        images: toStringList(json['images'] as List<dynamic>),
        color: json['color'],
      );
    }
    return ProductDataModel(
      id: '',
      name: '',
      description: '',
      price: 0.0,
      discount: 0.0,
      rate: 0.0,
      countInStock: 0,
      category: CategoryDataModel.empty(),
      brand: '',
      images: const [],
      color: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'rate': rate,
      'countInStock': countInStock,
      'category': (category as CategoryDataModel).toJson(),
      'brand': brand,
      'images': images,
      'color': color,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discount,
        rate,
        countInStock,
        category,
        brand,
        images,
        color,
      ];
}

List<String> toStringList(List<dynamic>? list) {
  if (list != null) {
    return list.map((imageUrl) {
      if (imageUrl != null) {
        return imageUrl.toString();
      }
      return '';
    }).toList();
  }
  return <String>[];
}
