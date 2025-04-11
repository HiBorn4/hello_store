import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/home_menu.dart';
import 'package:hello_store/screens/product_details_screen/product_details_screen.dart';
// import 'screens/category_screen.dart';

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
      home: HomeMenu(), // Set your desired starting screen
    );
  }
}
