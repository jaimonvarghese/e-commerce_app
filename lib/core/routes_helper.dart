import 'package:e_commerce_app/screens/home/main_food_page.dart';
import 'package:e_commerce_app/screens/home/widget/popular_food_detail.dart';
import 'package:e_commerce_app/screens/home/widget/recommended_food_detail.dart';
import 'package:get/get.dart';

class RoutesHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood() => '$popularFood';
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routers = [
    GetPage(name: initial, page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () => const PopularFoodDetail(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () => const RecommendedFoodDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}
