import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: CategoryScreen() // Set your desired starting screen
    );
  }
}
