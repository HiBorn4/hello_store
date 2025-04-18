import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/controllers/auth_controller.dart';
import 'package:hello_store/screens/address_screen.dart';
import 'package:hello_store/screens/buy_again_screen.dart';
import 'package:hello_store/screens/cart_screen.dart';
import 'package:hello_store/screens/coupon_screen.dart';
import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/login_screen.dart';
import 'package:hello_store/screens/login_screen2.dart';
import 'package:hello_store/screens/my_orders_screen.dart';
import 'package:hello_store/screens/product_list.dart';
import 'package:hello_store/screens/profile_screen.dart';
import 'package:hello_store/screens/search_screen.dart';
import 'package:hello_store/screens/signup_screen.dart';
import 'package:hello_store/screens/signup_screen2.dart';
import 'firebase_options.dart';
import 'screens/category_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'com.example.hellostore',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Stores',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: (isLoggedIn) ? HomeMenu() : LoginScreen()// Set your desired starting screen
    );
  }
}
