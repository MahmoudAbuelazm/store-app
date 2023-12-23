import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesSevice {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    Api api = Api();
    List<dynamic> data = await api.get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return products;
  }
}
