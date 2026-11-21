import 'package:geolocator/geolocator.dart';
import 'package:jawlati/core/services/location_service.dart';

class TestLocation extends LocationService {
  LocationFailure? issue;

  @override
  Future<Position> getCurrentLocation() async {
    if (issue case final failure?) throw failure;
    return Position(
      latitude: 31,
      longitude: 34,
      timestamp: DateTime.utc(2026),
      accuracy: 1,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );
  }
}
