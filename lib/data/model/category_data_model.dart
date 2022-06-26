import 'package:equatable/equatable.dart';

class CategoryDataModel extends Equatable {
  final String id;
  final String name;
  final String image;

  const CategoryDataModel({
    required this.id,
    required this.name,
    required this.image,
  });
factory CategoryDataModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return CategoryDataModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
    }
    return const CategoryDataModel(
      id: '',
      name: '',
      image: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryDataModel.empty() {
    return const CategoryDataModel(
      id: '',
      name: '',
      image: '',
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
