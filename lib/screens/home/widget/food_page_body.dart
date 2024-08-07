import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/controlers/popular_product_controler.dart';
import 'package:e_commerce_app/controlers/recommended_product_controler.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/core/routes_helper.dart';
import 'package:e_commerce_app/core/string.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/home/widget/popular_food_detail.dart';
import 'package:e_commerce_app/screens/widgets/app_column.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_app/screens/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimention.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        //print("Current value is "+_currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider section
        GetBuilder<PopularProductControler>(
          builder: (popularProduct) {
            return popularProduct.isLoaded
                ? Container(
                    //color: Colors.amber,
                    height: Dimention.pageView,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProduct.popularProductList[position]);
                      },
                    ),
                  )
                : const CircularProgressIndicator(
                    color: Colors.blue,
                  );
          },
        ),
        //Dots
        GetBuilder<PopularProductControler>(
          builder: (popularProduct) {
            return DotsIndicator(
              dotsCount: popularProduct.popularProductList.isEmpty
                  ? 1
                  : popularProduct.popularProductList.length,
              position: _currentPageValue.toInt(),

              decorator: DotsDecorator(
                activeColor: Colors.blue,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // onTap: (pos) {
              //   setState(() => _currentPosition = pos);
              // },
            );
          },
        ),
        kheight30,

        //recommended food section
        Container(
          margin: EdgeInsets.only(left: Dimention.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Recommended",
                color: Colors.black,
              ),
              kwidth10,
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              kwidth10,
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: SmallText(text: "Food Pariring"),
              ),
            ],
          ),
        ),
        //recommended food section listview
        GetBuilder<RecommendedProductControler>(
          builder: (recommendedProduct) {
            return recommendedProduct.isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recommendedProduct.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesHelper.getRecommendedFood(index,"homepage"));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimention.width20,
                              right: Dimention.width20,
                              bottom: Dimention.height10),
                          child: Row(
                            children: [
                              //image section
                              Container(
                                width: Dimention.listViewImgSize,
                                height: Dimention.height120,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimention.radius20),
                                  color: Colors.white10,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        //  "$BASE_URL/uploads/ ${popularProduct.img!}"
                                        '$BASE_URL$UPLOAD_URL${recommendedProduct.recommendedProductList[index].img!}'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimention.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimention.radius20),
                                      bottomRight:
                                          Radius.circular(Dimention.radius20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimention.width10,
                                        right: Dimention.width10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BigText(
                                          text:
                                              '${recommendedProduct.recommendedProductList[index].name!}',
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                        SmallText(
                                            text:
                                                "With chinese characteristics"),
                                        kheight10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: Colors.orange,
                                              size: Dimention.iconSize18,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: Colors.blue,
                                              size: Dimention.iconSize18,
                                            ),
                                            IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: Colors.redAccent,
                                              size: Dimention.iconSize18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : CircularProgressIndicator(
                    color: Colors.blue,
                  );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RoutesHelper.getPopularFood(index,"homepage"));
            },
            child: Container(
              height: Dimention.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimention.width10, right: Dimention.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.radius30),
                color: index.isEven ? Colors.yellow : Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      //  "$BASE_URL/uploads/ ${popularProduct.img!}"
                      '$BASE_URL$UPLOAD_URL${popularProduct.img!}'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimention.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimention.width20,
                  right: Dimention.width20,
                  bottom: Dimention.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.radius30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: 15, top: Dimention.height15, right: 25),
                child: AppColumn(
                  text: "${popularProduct.name!}",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
