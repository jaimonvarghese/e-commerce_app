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

  // dynamic width padding and margin
  static double width10 = screenHeight / 71.6;
  static double width15 = screenHeight / 47.7;
  static double width20 = screenHeight / 35.8;
  static double width30 = screenHeight / 23.8;

  //fontsize
  static double font20 = screenHeight / 35.8;

  //radius
  static double radius20 = screenHeight / 35.8;
  static double radius15 = screenHeight / 47.7;
  static double radius30 = screenHeight / 23.8;

  //icons
  static double iconSize24 = screenHeight / 29.8;
}
