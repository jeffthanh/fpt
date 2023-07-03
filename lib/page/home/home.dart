import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:fpt/page/home/widget/home_category.dart';
import 'package:fpt/page/home/widget/home_drawer.dart';
import 'package:fpt/page/home/widget/home_slider.dart';
import 'package:fpt/providers/cart_provider.dart';
import 'package:provider/provider.dart';

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
        title: const Text("Trang Chủ"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return badges.Badge(
                  badgeContent: Text('${value.items.length}'),
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                );
              },
            ),
          ),
        ],
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sản phẩm đặc biệt',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tất cả {7}',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListProductSpecial(),
        ],
      ),
    );
  }
}
