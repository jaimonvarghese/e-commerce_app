import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductControler extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductControler({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProdutList();
    if (response.statusCode == 200) {
      
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
    
      _isLoaded = true;
      update();
    } else {
      print("Not got recomment products");
    }
  }
}
