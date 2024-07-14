import 'package:e_commerce_app/controlers/cart_controler.dart';
import 'package:e_commerce_app/controlers/popular_product_controler.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/core/routes_helper.dart';
import 'package:e_commerce_app/core/string.dart';
import 'package:e_commerce_app/screens/cart/cart_page.dart';

import 'package:e_commerce_app/screens/widgets/app_column.dart';
import 'package:e_commerce_app/screens/widgets/app_icon.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/exandable_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductControler>().popularProductList[pageId];
    Get.find<PopularProductControler>()
        .initProduct(product, Get.find<CartControler>());
    // print("page id is" + pageId.toString());
    // print("product name is " + product.name.toString());
    return Scaffold(
        body: Stack(
          children: [
            //background Image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: Dimention.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('$BASE_URL$UPLOAD_URL${product.img!}'),
                  ),
                ),
              ),
            ),
            //Icons Widget
            Positioned(
              top: Dimention.height45,
              left: Dimention.width20,
              right: Dimention.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductControler>(builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductControler>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: Colors.blue,
                                  ),
                                ))
                            : Container(),
                        Get.find<PopularProductControler>().totalItems >= 1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                  text: Get.find<PopularProductControler>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    );
                  })
                ],
              ),
            ),
            //introuduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimention.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimention.width20,
                    right: Dimention.width20,
                    top: Dimention.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimention.radius20),
                    topLeft: Radius.circular(Dimention.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: '${product.name}',
                    ),
                    kheight10,
                    BigText(
                      text: "Introduce",
                      color: Colors.black,
                    ),
                    kheight10,
                    //expandble widget
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExandableTextWidget(text: product.description),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductControler>(
          builder: (popularProduct) {
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
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        kwidth5,
                        BigText(
                          text: popularProduct.inCartItem.toString(),
                          color: Colors.black,
                        ),
                        kwidth5,
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
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
                        popularProduct.addItem(product);
                      },
                      child: BigText(
                        text: "\$ ${product.price!} | Add to Cart",
                        color: Colors.white,
                        size: Dimention.font18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
