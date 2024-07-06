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
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                    width: 45,
                    height: 45,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
