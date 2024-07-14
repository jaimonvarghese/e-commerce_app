import 'package:e_commerce_app/controlers/cart_controler.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class PopularProductControler extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductControler({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartControler _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProdutList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      //  print("Increment" + quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      //  print("decrement" + quantity.toString());
    }

    update();
  }

  int checkQuantity(int quantity) {
    if ((inCartItem + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((inCartItem + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartControler cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exit or not" + exist.toString());
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
    print("the quantity in the cart is " + _inCartItem.toString());
  }

  void addItem(
    ProductModel product,
  ) {
    _cart.additem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);

    _cart.items.forEach(
      (key, value) {
        print("the id is" +
            value.id.toString() +
            "The quantity is " +
            value.quantity.toString());
      },
    );
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
