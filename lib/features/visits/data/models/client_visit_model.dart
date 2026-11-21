import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math' as math;

part 'client_visit_model.freezed.dart';
part 'client_visit_model.g.dart';

enum VisitStatus { checkedIn, checkedOut, cancelled }

@freezed
abstract class ClientVisit with _$ClientVisit {
  const ClientVisit._();

  const factory ClientVisit({
    required String id,
    required String clientId,
    String? clientName,
    required String salesmanId,
    String? salesmanName,
    required DateTime checkInTime,
    DateTime? checkOutTime,
    required double checkInLatitude,
    required double checkInLongitude,
    double? checkOutLatitude,
    double? checkOutLongitude,
    String? checkInAddress,
    String? checkOutAddress,
    String? notes,
    @Default(VisitStatus.checkedIn) VisitStatus status,
    String? purpose,
    List<String>? attachments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ClientVisit;

  factory ClientVisit.fromJson(Map<String, dynamic> json) =>
      _$ClientVisitFromJson(json);

  Duration? get visitDuration {
    if (checkOutTime == null) return null;
    return checkOutTime!.difference(checkInTime);
  }

  String get visitDurationFormatted {
    final duration = visitDuration;
    if (duration == null) return 'جاري الزيارة';

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}س ${minutes}د';
    } else {
      return '${minutes}د';
    }
  }

  bool get isActive => status == VisitStatus.checkedIn;

  String get statusText {
    switch (status) {
      case VisitStatus.checkedIn:
        return 'داخل عند العميل';
      case VisitStatus.checkedOut:
        return 'انتهت الزيارة';
      case VisitStatus.cancelled:
        return 'ملغاة';
    }
  }

  double? distanceBetweenCheckpoints() {
    if (checkOutLatitude == null || checkOutLongitude == null) return null;

    // حساب المسافة بين نقطتي الدخول والخروج
    final lat1Rad = checkInLatitude * (3.14159265359 / 180);
    final lon1Rad = checkInLongitude * (3.14159265359 / 180);
    final lat2Rad = checkOutLatitude! * (3.14159265359 / 180);
    final lon2Rad = checkOutLongitude! * (3.14159265359 / 180);

    final dLat = lat2Rad - lat1Rad;
    final dLon = lon2Rad - lon1Rad;

    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1Rad) *
            math.cos(lat2Rad) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.asin(math.sqrt(a));

    return 6371000 * c; // المسافة بالمتر
  }
}
