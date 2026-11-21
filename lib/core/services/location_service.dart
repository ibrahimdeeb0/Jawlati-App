import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static LocationService? _instance;
  LocationService._internal();
  
  factory LocationService() {
    return _instance ??= LocationService._internal();
  }

  Future<bool> requestLocationPermission() async {
    final permission = await Permission.location.request();
    return permission == PermissionStatus.granted;
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<Position?> getCurrentLocation() async {
    try {
      // التحقق من تفعيل خدمة الموقع
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationServiceException('خدمة الموقع غير مفعلة');
      }

      // التحقق من الصلاحيات
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationServiceException('تم رفض صلاحية الموقع');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationServiceException('صلاحية الموقع مرفوضة نهائياً');
      }

      // الحصول على الموقع الحالي
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } catch (e) {
      throw LocationServiceException('فشل في الحصول على الموقع: ${e.toString()}');
    }
  }

  Future<String?> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      // يمكن استخدام Geocoding API هنا
      // للبساطة سنعيد الإحداثيات فقط
      return '$latitude, $longitude';
    } catch (e) {
      return null;
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  bool isWithinRange(double lat1, double lon1, double lat2, double lon2, {double maxDistanceMeters = 100}) {
    final distance = calculateDistance(lat1, lon1, lat2, lon2);
    return distance <= maxDistanceMeters;
  }

  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // تحديث كل 10 متر
      ),
    );
  }
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);

  @override
  String toString() => message;
}