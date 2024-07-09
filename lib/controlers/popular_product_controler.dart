import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductControler extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductControler({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProdutList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }
}
