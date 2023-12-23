import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Api api = Api();
    List<dynamic> data =
        await api.get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
