import 'package:furniture_shopping_app/data/dataManul.dart';
import 'package:furniture_shopping_app/data/model/productsModel.dart';

class Data {
  List<ProductsModel> prodctes = [];

  Future gitProd() async {
    data.forEach((element) {
      prodctes.add(ProductsModel.fromMab(element));

      print(element);
    });
    print(prodctes[2]);
  }
}
