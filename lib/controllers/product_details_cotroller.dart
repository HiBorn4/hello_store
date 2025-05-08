

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class ProductDetailsCotroller {
  void addToCart(Map<String, dynamic> item,BuildContext context) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final cartItem = {
      'id': item['uuid'],
      'title':  item['title']?['tr'] ?? 'No Name',
      'price': (item['price'] == null || item['price'] == 0 || item['price'].toString().isEmpty)
          ? 500
          : item['price'],
      'image': item['img'],
      'count':1
    };

    final cartRef = FirebaseFirestore.instance.collection('cart').doc(uid);

    try {
      await cartRef.set({
        'cart_items': FieldValue.arrayUnion([cartItem])
      }, SetOptions(merge: true));


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Item added to cart',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[800],
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(16),
        ),
      );

    } catch (e) {

      Get.snackbar(
        'Error',
        'Failed to add to cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}