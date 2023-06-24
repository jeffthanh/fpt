import 'package:flutter/material.dart';
import 'package:fpt/page/category/widget/Category_body.dart';

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
      ),
      body: const CategoryBody(),
    );
  }
}
