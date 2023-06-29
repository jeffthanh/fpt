import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpt/page/auth/splash_screen.dart';
import 'package:fpt/page/auth/widget/auth_manager.dart';
import 'package:fpt/page/auth/widget/auth_screen.dart';
import 'package:fpt/page/cart/cart.dart';
import 'package:fpt/page/category/category.dart';
import 'package:fpt/page/home/home.dart';
import 'package:fpt/providers/category_provider.dart';
import 'package:fpt/providers/product_provider.dart';
import 'package:fpt/providers/slider_provider.dart';
import 'package:provider/provider.dart';

import 'page/product/product.dart';

void main() async {
  await dotenv.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthManager(),
      ),
      ChangeNotifierProvider(
        create: (_) => SliderProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
    ],
    child: Consumer<AuthManager>(
      builder: (context, authManager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: authManager.isAuth
              ? const HomePage()
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  },
                ),
          routes: {
            CategoryPage.routerName: (context) => const CategoryPage(),
            ProductPage.routerName: (context) => const ProductPage(),
            AuthScreen.routerName: (context) => const AuthScreen(),
            CartPage.routerName: (context) => const CartPage(),
          },
        );
      },
    ),
  ));
}
