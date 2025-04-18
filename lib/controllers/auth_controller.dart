import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/login_screen2.dart';
import 'package:hello_store/utils/snackbar.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends GetxController
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  Future<void> askLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print("Location permission granted.");

    } else {

      print("Location permission denied.");
    }
  }

  Future<void> login(String email, String password) async {
    if (!isValidEmail(email)) {
      snackBarMsg("Invalid Email ,Please enter a valid email address");
      return;
    }

    if (!isValidPassword(password)) {
      snackBarMsg("Weak Password ,Password must be at least 6 characters long");
      return;
    }

    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(()=>HomeMenu());
    } catch (e) {
      snackBarMsg("User not Found");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String email, String password) async {
    if (!isValidEmail(email)) {
      snackBarMsg("Invalid Email ,Please enter a valid email address");
      return;
    }

    if (!isValidPassword(password)) {
      snackBarMsg("Weak Password ,Password must be at least 6 characters long");
      return;
    }

    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
     await  askLocationPermission();
    //  Get.snackbar("Success", "Signup Successful");
      Get.offAll(()=>HomeMenu());
    } catch (e) {
      snackBarMsg(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout(var context) async {
    await _auth.signOut();
    //ScaffoldMessenger.of(context).showSnackBar(
    //  SnackBar(content: Text("Logged out successfully")),
    //);
    Get.to(() => LoginScreen());

  }

  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }





}