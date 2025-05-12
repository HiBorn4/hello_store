import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Observing cart items as an RxList
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  RxInt totalPrice=0.obs;
  RxInt discount=300.obs;
  RxInt platformFee=02.obs;
  RxInt finaltotalPrice=0.obs;
  RxInt totalwithDiscount=0.obs;

  Future<void> fetchCartItems() async {
    try {
      var cartRef = _firestore.collection('cart').doc(userId);
      var docSnapshot = await cartRef.get();

      if (docSnapshot.exists) {
        var cartData = docSnapshot.data()?['cart_items'] as List<dynamic>;

        totalPrice.value=0;
        cartItems.value = cartData.map((item) {
          int prices = item['price'];
          int count=item['count'];
          totalPrice.value+=prices*count;

          return {
            "image": item['image'],
            "title": item['title'],
            "id":item['id'],
            "price": item['price'],
            "count":item['count']
          };
        }).toList();

        finaltotalPrice.value=totalPrice.value+platformFee.value;
        totalwithDiscount.value=finaltotalPrice.value+discount.value;

      } else {
        throw Exception("Cart data not found for user: $userId");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<void> incrementCount(int index) async {
    try {
      final cartRef = FirebaseFirestore.instance.collection('cart').doc(userId);
      final snapshot = await cartRef.get();

      if (snapshot.exists) {
        List<dynamic> cartItems = snapshot.data()?['cart_items'] ?? [];

        if (cartItems.isNotEmpty) {

          int currentCount = cartItems[index]['count'] ?? 1;
          cartItems[index]['count'] = currentCount + 1;

          await cartRef.update({'cart_items': cartItems});
          print('Count incremented .');
        }
      }
    } catch (e) {
      print('Error incrementing count: $e');
    }
  }
  Future<void> decrementCount(int index) async {
    try {
      final cartRef = FirebaseFirestore.instance.collection('cart').doc(userId);
      final snapshot = await cartRef.get();

      if (snapshot.exists) {
        List<dynamic> cartItems = snapshot.data()?['cart_items'] ?? [];

        if (cartItems.isNotEmpty) {

          int currentCount = cartItems[index]['count'] ?? 1;
          cartItems[index]['count'] = currentCount -1;

          await cartRef.update({'cart_items': cartItems});
          print('Count incremented .');
        }
      }
    } catch (e) {
      print('Error incrementing count: $e');
    }
  }


}
