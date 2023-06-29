import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routerName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang Giỏ Hàng'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Image(
                    image: NetworkImage(
                        'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-6/324250268_547509183986615_983233815793855971_n.jpg?_nc_cat=106&cb=99be929b-59f725be&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=-5zWYS0-_HYAX-Vy87y&_nc_ht=scontent.fsgn2-5.fna&oh=00_AfD2LgLJ03Ikdf_TB2ax4hiYYA9-Vl67Ca4gX4UsTPx9cw&oe=64A148DD'),
                    fit: BoxFit.fill,
                  ),
                  title: const Text(
                    'nhung lý',
                    maxLines: 1,
                  ),
                  subtitle: const Text('100vnd'),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Row(
                      children: [
                        Icon(Icons.remove, size: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 10,
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
