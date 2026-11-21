import 'dart:async';

import 'package:geolocator/geolocator.dart';

enum LocationFailure implements Exception {
  disabled,
  denied,
  deniedForever,
  timedOut,
}

class LocationService {
  Future<Position> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw LocationFailure.disabled;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw LocationFailure.deniedForever;
    }
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      throw LocationFailure.denied;
    }

    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } on TimeoutException {
      throw LocationFailure.timedOut;
    } on LocationServiceDisabledException {
      throw LocationFailure.disabled;
    }
  }

  Future<bool> openAppSettings() => Geolocator.openAppSettings();
}
