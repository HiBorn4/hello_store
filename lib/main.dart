import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/screens/address_screen.dart';
import 'package:hello_store/screens/cart_screen.dart';
import 'package:hello_store/screens/coupon_screen.dart';
import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/my_orders_screen.dart';
import 'package:hello_store/screens/product_list.dart';
import 'package:hello_store/screens/profile_screen.dart';

import 'screens/category_screen.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Stores',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: CartScreen() // Set your desired starting screen
    );
  }
}
