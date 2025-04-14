import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/screens/Address/address_screen.dart';
import 'package:hello_store/screens/Cart/cart.dart';
import 'package:hello_store/screens/HomePage/homepage.dart';
import 'package:hello_store/screens/Order%20Summary/OrderSummaryScreen.dart';
import 'package:hello_store/screens/Payment/payment_screen.dart';
import 'package:hello_store/screens/Track%20Order/TrackOrderScreen.dart';

import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/product_details_screen/product_details_screen.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeMenu()// Set your desired starting screen
    );
  }
}
