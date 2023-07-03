import 'package:flutter/material.dart';
import 'package:fpt/page/category/widget/Category_body.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/cart_provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  static const routerName = '/category';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg['name']),
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
      body: const CategoryBody(),
    );
  }
}
