import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/core/routes_helper.dart';
import 'package:e_commerce_app/screens/widgets/app_icon.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/exandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RoutesHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    size: Dimention.font26,
                    text: "Chinese Side",
                    color: Colors.black,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimention.radius20),
                    topRight: Radius.circular(Dimention.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600"),
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimention.width20, right: Dimention.width20),
                  child: ExandableTextWidget(
                    text:
                        "For a long time, food photographs tended to be shot and composed in a manner similar to the way people were used to encountering their food: laid out on a table setting and shot from an overhead perspectivFor a long time, food photographs tended to be shot and composed in a manner similar to the way people were used to encountering their food: laid out on a table setting and shot from an overhead perspectivFor a long time, food photographs tended to be shot and composed in a manner similar to the way people were used to encountering their food: laid out on a table setting and shot from an overhead perspectiv",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimention.width20 * 2.5,
              right: Dimention.width20 * 2.5,
              top: Dimention.height10,
              bottom: Dimention.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$12.88  X  0",
                  color: Colors.black,
                  size: Dimention.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
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
        ],
      ),
    );
  }
}
