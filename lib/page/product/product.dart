import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const routerName = '/Product';
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final product = data['data'];
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}
