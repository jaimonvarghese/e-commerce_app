import 'package:e_commerce_app/controlers/popular_product_controler.dart';
import 'package:e_commerce_app/controlers/recommended_product_controler.dart';
import 'package:e_commerce_app/core/routes_helper.dart';
import 'package:e_commerce_app/screens/cart/cart_page.dart';
import 'package:e_commerce_app/screens/home/main_food_page.dart';
import 'package:e_commerce_app/screens/home/widget/recommended_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/dependenies.dart' as dep;
import 'screens/home/widget/popular_food_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductControler>().getPopularProductList();
    Get.find<RecommendedProductControler>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainFoodPage(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.routers,
    );
  }
}
