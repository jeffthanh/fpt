import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String image;
  final String name;
  final int price;
  final int quatity;

  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quatity});
}

class CartProvider extends ChangeNotifier {
  Map<int, CartItem> items = {};

  void addCart(
      int productId, String image, String name, int price, int quantity) {
    if (items.containsKey(productId)) {
      //ton tai san pham
      items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              image: value.image,
              name: value.name,
              price: value.price,
              quatity: value.quatity + quantity));
    } else {
      //chua ton tai
      items.putIfAbsent(
          productId,
          () => CartItem(
              id: productId,
              image: image,
              name: name,
              price: price,
              quatity: quantity));
    }
    notifyListeners();
  }

  void increase(int productId, [int quantity = 1]) {
    items.update(
      productId,
      (value) => CartItem(
          id: value.id,
          image: value.image,
          name: value.name,
          price: value.price,
          quatity: value.quatity + quantity),
    );
    notifyListeners();
  }

  void decrease(int productId, [int quantity = 1]) {
    if (items[productId]?.quatity == quantity) {
      items.removeWhere((key, value) => key == productId);
    } else {
      items.update(
        productId,
        (value) => CartItem(
            id: value.id,
            image: value.image,
            name: value.name,
            price: value.price,
            quatity: value.quatity - quantity),
      );
    }
    notifyListeners();
  }

  void removeItems() {
    items = {};
    notifyListeners();
  }
}
