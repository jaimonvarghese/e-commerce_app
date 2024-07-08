import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/screens/widgets/app_column.dart';
import 'package:e_commerce_app/screens/widgets/app_icon.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/exandable_text_widget.dart';

import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600"),),),
            ),
          ),
          //Icons Widget
          Positioned(
            top: Dimention.height45,
            left: Dimention.width20,
            right: Dimention.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  const AppColumn(
                    text: 'Chinese Side',
                  ),
                  kheight10,
                  BigText(
                    text: "Introduce",
                    color: Colors.black,
                  ),
                  kheight10,
                  //expandble widget
                  const Expanded(
                    child:  SingleChildScrollView(
                      child: ExandableTextWidget(
                          text:
                              "The process of food photography begins with the purchase of the food and ingredients. Only the most visually perfect foodstuffs are acceptable and multiple backup or test items are usually needed. As a result, purchase of the food and ingredients is a very time-consuming process."),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
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
                  const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  kwidth5,
                  BigText(
                    text: "0",
                    color: Colors.black,
                  ),
                  kwidth5,
                  const Icon(
                    Icons.add,
                    color: Colors.black,
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
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
