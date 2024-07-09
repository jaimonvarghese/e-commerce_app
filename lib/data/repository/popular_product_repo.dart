import 'package:e_commerce_app/core/string.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProdutList() async {
    return await apiClient.getData(POPULAR_PRODUCT_URL);

  }
}
