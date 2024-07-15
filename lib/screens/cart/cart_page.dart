import 'dart:ffi';

import 'package:e_commerce_app/controlers/cart_controler.dart';
import 'package:e_commerce_app/controlers/popular_product_controler.dart';
import 'package:e_commerce_app/controlers/recommended_product_controler.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/core/routes_helper.dart';
import 'package:e_commerce_app/screens/home/main_food_page.dart';
import 'package:e_commerce_app/screens/home/widget/popular_food_detail.dart';
import 'package:e_commerce_app/screens/widgets/app_icon.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/string.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimention.height20 * 3,
            left: Dimention.width20,
            right: Dimention.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RoutesHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                  ),
                ),
                kwidth10,
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimention.height20 * 5,
            left: Dimention.width20,
            right: Dimention.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimention.height15),
              //  color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartControler>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: Dimention.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductControler>()
                                          .popularProductList
                                          .indexOf(_cartList[index].product!);
                                  if (popularIndex > 0) {
                                    Get.toNamed(
                                      RoutesHelper.getPopularFood(
                                          popularIndex, "cartpage"),
                                    );
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductControler>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                    Get.toNamed(RoutesHelper.getRecommendedFood(
                                        recommendedIndex, "cartpage"));
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: Dimention.height10),
                                  width: Dimention.height20 * 5,
                                  height: Dimention.height20 * 5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '$BASE_URL$UPLOAD_URL${cartController.getItems[index].img!}'),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        Dimention.radius20),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              kwidth10,
                              Expanded(
                                child: Container(
                                  height: Dimention.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicey"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: " \$ ${cartController
                                                .getItems[index]!.price
                                                .toString()}",
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimention.height10,
                                                bottom: Dimention.height10,
                                                left: Dimention.width10,
                                                right: Dimention.width10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimention.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.additem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                kwidth5,
                                                BigText(
                                                  text: _cartList[index]
                                                      .quantity
                                                      .toString(), //popularProduct.inCartItem.toString(),
                                                  color: Colors.black,
                                                ),
                                                kwidth5,
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.additem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartControler>(
        builder: (cartcontroller) {
          return Container(
            height: Dimention.height120,
            padding: EdgeInsets.only(
                top: Dimention.height30,
                bottom: Dimention.height30,
                left: Dimention.width20,
                right: Dimention.width20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimention.radius20 * 2),
                topRight: Radius.circular(Dimention.radius20 * 2),
              ),
              color: Colors.grey[350],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimention.height20,
                      bottom: Dimention.height20,
                      left: Dimention.width20,
                      right: Dimention.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimention.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      kwidth5,
                      BigText(
                        text:" \$ ${ cartcontroller.totalAmount.toString()}",
                        color: Colors.black,
                      ),
                      kwidth5,
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimention.height20,
                      bottom: Dimention.height20,
                      left: Dimention.width20,
                      right: Dimention.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimention.radius20),
                    color: Colors.blue,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //  popularProduct.addItem(product);
                    },
                    child: BigText(
                      text: "Check out",
                      color: Colors.white,
                      size: Dimention.font18,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
