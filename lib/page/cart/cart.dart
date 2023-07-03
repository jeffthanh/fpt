import 'package:flutter/material.dart';
import 'package:fpt/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routerName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<CartProvider>(context).items;
    final totalPrice = Provider.of<CartProvider>(context).calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trang Giỏ Hàng',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0, top: 20),
            child: Text('$totalPrice VNĐ'),
          )
        ],
      ),
      body: itemsData.isEmpty
          ? const Center(
              child: Text("Chưa có sản phẩm"),
            )
          : Stack(
              children: [
                Positioned.fill(
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      var dataItem = value.items.values.toList();
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image(
                              image: NetworkImage(dataItem[index].image),
                              fit: BoxFit.fill,
                            ),
                            title: Text(
                              dataItem[index].name,
                              maxLines: 1,
                            ),
                            subtitle: Text('${dataItem[index].price} VNĐ'),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .decrease(value.items.keys
                                                .toList()[index]);
                                      },
                                      child:
                                          const Icon(Icons.remove, size: 20)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${dataItem[index].quatity}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .increase(
                                              value.items.keys.toList()[index]);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: value.items.length,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('Mua Hàng'),
                      onPressed: () {
                        Null;
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
