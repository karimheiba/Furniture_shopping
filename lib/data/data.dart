import 'package:furniture_shopping_app/data/dataManul.dart';
import 'package:furniture_shopping_app/data/model/productsModel.dart';

class Data {
  static List prodctes = [];

  static Future gitProd() async {
    data.forEach((element) {
      prodctes.add(ProductsModel.fromMab(element));
    });
    print(prodctes.toString());
  }
}
