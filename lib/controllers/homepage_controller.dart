import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:hello_store/models/category_model.dart';
import 'package:hello_store/models/product_model.dart';

class HomePageController extends GetxController {

  var street="".obs;
  var sublocality="".obs;
  var locality="".obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  var productList = <Map<String, dynamic>>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   fetchCategories();
   fetchProducts();
  }



  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Location services are disabled.");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print("Location permission not granted.");
        return;
      }

      Position position = await Geolocator.getCurrentPosition();

      print("Coordinates: ${position.latitude}, ${position.longitude}");



      List<Placemark> placemarks = await placemarkFromCoordinates(
       position.latitude
       //17.385044
        ,
        position.longitude,
        // 78.486671,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        String address =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        print("📍 User Location: $address");
        street.value=place.street!;
        sublocality.value=place.subLocality!;
        locality.value=place.locality!;

      } else {
        print("No placemark data found.");
      }
    } catch (e) {
      print("Error fetching location/address: $e");
    }
  }

  void fetchCategories() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('p_category').get();


      final items = querySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();

      categoryList.value = items;
    } catch (e) {
      print(' Categoty Error fetching items: $e');
    }
  }



  void fetchProducts() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('T_products').get();

      for (var doc in querySnapshot.docs) {
        print('Document ID: ${doc.id}');
        print('Document Data: ${doc.data()}');
      }

      productList.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Product Error fetching items: $e');
    }
  }




}