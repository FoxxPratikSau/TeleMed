import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/cart_controller.dart';
import 'package:tele_med/models/cart_model.dart';
import 'package:tele_med/models/medicines.dart';

class medicine_controller extends GetxController {
  List<medicine> _medicine_items = [];
  List<medicine> get medicine_items => _medicine_items;

  List<medicine> _medicine_items2 = [];
  List<medicine> get medicine_items2 => _medicine_items2;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getMedicineList() async {
    print("xyz");
    final String medicineJson =
        await rootBundle.loadString("assets/files/medicines.json");
    final decodedData = json.decode(medicineJson);
    // Parse the JSON data using the fromJson method of the medicine class
    _medicine_items = (decodedData["medicines"] as List<dynamic>)
        .map((e) => medicine.fromJson(e))
        .toList();

    update();
  }

  Future<void> getMedicine2List() async {
    print("xyz");
    final String medicineJson =
        await rootBundle.loadString("assets/files/medicine2.json");
    final decodedData = json.decode(medicineJson);
    // Parse the JSON data using the fromJson method of the medicine class
    _medicine_items2 = (decodedData["medicines"] as List<dynamic>)
        .map((e) => medicine.fromJson(e))
        .toList();

    update();
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      //print('increment');
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item count', 'You cannot reduce more!');
      if (_inCartItems > 0) {
        _quantity = -_quantity;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(medicine product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    //print('The qty in the cart is $_inCartItems');
  }

  void addItem(medicine product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      //print('The id is ${value.id} and the quantity is ${value.quantity}');
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<cart_model> get getItems {
    return _cart.getItems;
  }
}
