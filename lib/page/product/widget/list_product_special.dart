import 'package:flutter/material.dart';
import 'package:fpt/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProductSpecial(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data!;

          return snapshot.hasData
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(
                        width: 100,
                        height: 80,
                        child: Image(
                          image: NetworkImage('${data[index].image}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        '${data[index].name}',
                        maxLines: 2,
                      ),
                      subtitle: Text('${data[index].price}  vnd'),
                      trailing: const Icon(Icons.shopping_cart),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 10,
                    );
                  },
                  itemCount: data.length,
                )
              : const Center(
                  child: Text('empty product'),
                );
        },
      ),
    );
  }
}
