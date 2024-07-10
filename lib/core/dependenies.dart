import 'package:e_commerce_app/controlers/popular_product_controler.dart';
import 'package:e_commerce_app/core/string.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

import '../controlers/recommended_product_controler.dart';

Future<void> init() async {

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  //controlers
   Get.lazyPut(() => PopularProductControler(popularProductRepo: Get.find()));
   Get.lazyPut(() => RecommendedProductControler( recommendedProductRepo: Get.find()));
}
