import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_med/helpers_n_controllers/cart_repo.dart';
import 'package:tele_med/models/cart_model.dart';
import 'package:tele_med/models/medicines.dart';
import 'package:tele_med/widgets/big_font.dart';
import 'package:tele_med/widgets/small_font.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, cart_model> _items = {};
  Map<int, cart_model> get items => _items;
  List<cart_model> storageItems = [];

  void addItem(medicine product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return cart_model(
          id: value.id,
          name: value.name,
          image: value.image,
          price: value.price,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return cart_model(
            id: product.id,
            name: product.name,
            image: product.image,
            price: product.price,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
          '',
          '',
          animationDuration: const Duration(seconds: 2),
          barBlur: 10.0,
          titleText: BigFont(
            text: 'Item count',
            color: Colors.red,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.bold,
            size: 20.0,
          ),
          messageText:
              SmallFont(text: 'You should at least add 1 item to the cart.'),
        );
      }

      update();
    }
  }

  bool existInCart(medicine product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(medicine product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<cart_model> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }
}
