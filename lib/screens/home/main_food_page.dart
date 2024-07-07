import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/screens/home/widget/food_page_body.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Container(
              margin:  EdgeInsets.only(top: Dimention.height45, bottom: Dimention.height15),
              padding:  EdgeInsets.only(left: Dimention.width20, right: Dimention.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Banladesh",
                        size: 30,
                      ),
                      Row(
                        children: [
                          SmallText(text: "City"),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimention.height45,
                    height: Dimention.height45,
                    child:  Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimention.iconSize24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimention.radius15),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
