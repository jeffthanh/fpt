import 'package:flutter/material.dart';
import 'package:fpt/page/home/widget/home_category.dart';
import 'package:fpt/page/home/widget/home_drawer.dart';
import 'package:fpt/page/home/widget/home_slider.dart';

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
        title: const Text("Home Page"),
      ),
      body: const Column(
        children: [
          HomeSlider(),
          SizedBox(
            height: 20,
          ),
          HomeCategory(),
        ],
      ),
    );
  }
}
