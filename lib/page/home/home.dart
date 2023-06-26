import 'package:flutter/material.dart';
import 'package:fpt/page/home/widget/home_category.dart';
import 'package:fpt/page/home/widget/home_drawer.dart';
import 'package:fpt/page/home/widget/home_slider.dart';

import '../product/widget/list_product_special.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Column(
        children: [
          HomeSlider(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Danh mục sản phẩm',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tất cả {4}',
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          HomeCategory(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sản phẩm đặc biệt',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tất cả {4}',
                ),
              ],
            ),
          ),
          ListProductSpecial(),
        ],
      ),
    );
  }
}
