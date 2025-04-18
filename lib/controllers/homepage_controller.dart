import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

class HomePageController extends GetxController {
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
        17.385044, 78.486671,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        String address =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
        print("📍 User Location: $address");
         print(place);

      } else {
        print("No placemark data found.");
      }
    } catch (e) {
      print("Error fetching location/address: $e");
    }
  }
}