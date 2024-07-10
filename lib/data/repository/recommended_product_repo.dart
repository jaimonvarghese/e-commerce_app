import 'package:e_commerce_app/core/string.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProdutList() async {
    return await apiClient.getData(RECOMMENDED_PRODUCT_URL);

  }
}
