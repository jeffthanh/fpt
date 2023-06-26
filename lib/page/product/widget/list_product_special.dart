import 'package:flutter/material.dart';

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Image(
                image: NetworkImage(
                    'https://cdn.popsww.com/blog/sites/2/2021/12/co-hai-tac-bang-mu-rom.jpg'),
                fit: BoxFit.fill,
              ),
              title: Text(
                '2 thang loll lam bieng nhu di an roi eo pit rua 2 thg xao loll',
                maxLines: 2,
              ),
              subtitle: Text('20000 vnd'),
              trailing: Icon(Icons.shopping_cart),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 10,
            );
          },
          itemCount: 10),
    );
  }
}
