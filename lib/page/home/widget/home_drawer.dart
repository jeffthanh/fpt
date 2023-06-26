import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/widget/auth_manager.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          const SizedBox(
            width: 100,
            height: 100,
            child: Image(
              image: NetworkImage(
                  'https://cdn.popsww.com/blog/sites/2/2021/12/co-hai-tac-bang-mu-rom.jpg'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Trang chủ'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Thoát ra"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/');
                      context.read<AuthManager>().logout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
