import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/login_screen2.dart';

class AuthController extends GetxController
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    if (!isValidEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address",
        borderColor: Colors.white);
      return;
    }

    if (!isValidPassword(password)) {
      Get.snackbar("Weak Password", "Password must be at least 6 characters long",
       snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.white,backgroundColor:
      Colors.white,colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login Successful");
      Get.offAll(()=>HomeMenu());
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String email, String password) async {
    if (!isValidEmail(email)) {
      Get.snackbar("Invalid Email", "Please enter a valid email address");
      return;
    }

    if (!isValidPassword(password)) {
      Get.snackbar("Weak Password", "Password must be at least 6 characters long");
      return;
    }

    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Signup Successful");
      Get.offAll(()=>HomeMenu());
    } catch (e) {
      Get.snackbar("Signup Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout(var context) async {
    await _auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logged out successfully")),
    );
    Get.to(() => LoginScreen());

  }

  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }





}