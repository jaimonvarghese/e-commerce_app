import 'package:get/get.dart';

class Dimention {
  //Screen Size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.23;
  static double pageViewContainer = screenHeight / 3.25;
  static double pageViewTextContainer = screenHeight / 5.96;

  // dynamic height padding and margin
  static double height10 = screenHeight / 71.6;
  static double height15 = screenHeight / 47.7;
  static double height20 = screenHeight / 35.8;
  static double height30 = screenHeight / 23.8;
  static double height45 = screenHeight / 15.9;
  static double height120 = screenHeight / 5.96;
  // static double height900 = screenHeight / 5.96;

  // dynamic width padding and margin
  static double width10 = screenHeight / 71.6;
  static double width15 = screenHeight / 47.7;
  static double width20 = screenHeight / 35.8;
  static double width30 = screenHeight / 23.8;

  //fontsize
  static double font18 = screenHeight / 39.7;
  static double font20 = screenHeight / 35.8;
  static double font26 = screenHeight / 27.5;

  //radius
  static double radius20 = screenHeight / 35.8;
  static double radius15 = screenHeight / 47.7;
  static double radius30 = screenHeight / 23.8;

  //icons
  static double iconSize24 = screenHeight / 29.8;
  static double iconSize18 = screenHeight / 39.7;

  static double listViewImgSize = screenWidth / 3.0;
  static double listViewTextContSize = screenWidth / 3.6;

  static double popularFoodImgSize = screenHeight / 2.04;
}
