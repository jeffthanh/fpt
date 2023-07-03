import 'package:flutter/material.dart';
import 'package:fpt/providers/category_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../providers/cart_provider.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  late Future<List<Product>> productInCategoryFuture;

  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    productInCategoryFuture =
        Provider.of<CategoryProvider>(context).getProductCategory(arg['id']);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      initialData: const [],
      future: productInCategoryFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> data = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: {"data": data[index]},
                  );
                },
                child: GridTile(
                  footer: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text(data[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data[index].price} vnd',
                            style: const TextStyle(
                                color: Colors.yellow, fontSize: 16),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCart(data[index].id!, data[index].image,
                                  data[index].name, data[index].price, 1);
                        },
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(data[index].image),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Container(
            child: const Text('err'),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
