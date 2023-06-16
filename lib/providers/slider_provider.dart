import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/slider_model.dart';

class SliderProvider extends ChangeNotifier {
  Future<List<Sli>> getSlider() async {
    const url = 'http://192.168.1.7:3000/api/slider';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List<Sli> data = List<Sli>.from(
          jsonData.map((slider) => Sli.fromJson(jsonEncode(slider)))).toList();
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
