import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpt/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getCategory() async {
    const url = 'http://192.168.1.7:3000/api/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Category> data = List<Category>.from(
          jsonData.map((cate) => Category.fromJson(jsonEncode(cate)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getProductCategory(int categoryid) async {
    final url = 'http://192.168.1.7:3000/api/categories/$categoryid/products';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Product> data = List<Product>.from(
              jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
