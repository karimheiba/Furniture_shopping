class ProductsModel {
  ProductsModel({
    this.description,
    this.imgae,
    this.name,
    this.price,
  });

  String? name;
  String? imgae;
  String? description;
  int? price;
  factory ProductsModel.fromMab(Map<String, dynamic> fromMap) {
    return ProductsModel(
      name: fromMap["name"],
      description: fromMap['description'],
      imgae: fromMap['imgae'],
      price: fromMap['price'],
    );
  }
}
