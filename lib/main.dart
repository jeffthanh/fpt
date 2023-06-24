import 'package:flutter/material.dart';
import 'package:fpt/page/category/category.dart';
import 'package:fpt/page/home/home.dart';
import 'package:fpt/providers/category_provider.dart';
import 'package:fpt/providers/slider_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SliderProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (context) => const HomePage(),
        CategoryPage.routerName: (context) => const CategoryPage(),
        // ProductPage.routerName: (context) => const ProductPage(),
      },
    ),
  ));
}
