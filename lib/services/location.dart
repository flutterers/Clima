import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late final double long;
  late final double lat;

  Future<void> getCurrentLocation() async {
    try {
      /// Determine the current position of the device.
      ///
      /// When the location services are not enabled or permissions
      /// are denied the `Future` will return an error.
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      long = position.longitude;
      lat = position.latitude;
      if (kDebugMode) {
        print("long: $long, lat: $lat)");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
