import '../../../../core/services/location_service.dart';
import '../models/client_visit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class VisitsRepository {
  final LocationService _locationService;
  final String _visitsKey = 'client_visits';
  final String _currentVisitKey = 'current_visit';
  
  VisitsRepository(this._locationService);

  // بدء زيارة جديدة
  Future<ClientVisit> checkIn({
    required String clientId,
    required String clientName,
    required String salesmanId,
    String? salesmanName,
    String? purpose,
    String? notes,
  }) async {
    try {
      // التحقق من عدم وجود زيارة نشطة
      final currentVisit = await getCurrentVisit();
      if (currentVisit != null) {
        throw Exception('يوجد زيارة نشطة بالفعل. يجب إنهاء الزيارة الحالية أولاً');
      }

      // الحصول على الموقع الحالي
      final position = await _locationService.getCurrentLocation();
      if (position == null) {
        throw Exception('فشل في الحصول على الموقع');
      }

      // إنشاء الزيارة الجديدة
      final visit = ClientVisit(
        id: const Uuid().v4(),
        clientId: clientId,
        clientName: clientName,
        salesmanId: salesmanId,
        salesmanName: salesmanName,
        checkInTime: DateTime.now(),
        checkInLatitude: position.latitude,
        checkInLongitude: position.longitude,
        checkInAddress: await _locationService.getAddressFromCoordinates(
          position.latitude,
          position.longitude,
        ),
        purpose: purpose,
        notes: notes,
        status: VisitStatus.checkedIn,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // حفظ الزيارة الحالية
      await _saveCurrentVisit(visit);
      
      // إضافة إلى قائمة جميع الزيارات
      await _addVisitToHistory(visit);

      return visit;
    } catch (e) {
      throw Exception('فشل في بدء الزيارة: ${e.toString()}');
    }
  }

  // إنهاء الزيارة
  Future<ClientVisit> checkOut({
    String? notes,
    List<String>? attachments,
  }) async {
    try {
      // الحصول على الزيارة الحالية
      final currentVisit = await getCurrentVisit();
      if (currentVisit == null) {
        throw Exception('لا توجد زيارة نشطة');
      }

      // الحصول على موقع الخروج
      final position = await _locationService.getCurrentLocation();
      if (position == null) {
        throw Exception('فشل في الحصول على الموقع');
      }

      // تحديث الزيارة
      final updatedVisit = currentVisit.copyWith(
        checkOutTime: DateTime.now(),
        checkOutLatitude: position.latitude,
        checkOutLongitude: position.longitude,
        checkOutAddress: await _locationService.getAddressFromCoordinates(
          position.latitude,
          position.longitude,
        ),
        notes: notes ?? currentVisit.notes,
        attachments: attachments ?? currentVisit.attachments,
        status: VisitStatus.checkedOut,
        updatedAt: DateTime.now(),
      );

      // مسح الزيارة الحالية
      await _clearCurrentVisit();
      
      // تحديث السجل
      await _updateVisitInHistory(updatedVisit);

      return updatedVisit;
    } catch (e) {
      throw Exception('فشل في إنهاء الزيارة: ${e.toString()}');
    }
  }

  // الحصول على الزيارة الحالية النشطة
  Future<ClientVisit?> getCurrentVisit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final visitJson = prefs.getString(_currentVisitKey);
      
      if (visitJson == null) return null;
      
      final visitMap = json.decode(visitJson);
      return ClientVisit.fromJson(visitMap);
    } catch (e) {
      return null;
    }
  }

  // الحصول على سجل جميع الزيارات
  Future<List<ClientVisit>> getAllVisits() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final visitsJson = prefs.getStringList(_visitsKey) ?? [];
      
      return visitsJson
          .map((json) => ClientVisit.fromJson(jsonDecode(json)))
          .toList()
        ..sort((a, b) => b.checkInTime.compareTo(a.checkInTime));
    } catch (e) {
      return [];
    }
  }

  // الحصول على زيارات عميل محدد
  Future<List<ClientVisit>> getClientVisits(String clientId) async {
    final allVisits = await getAllVisits();
    return allVisits.where((visit) => visit.clientId == clientId).toList();
  }

  // الحصول على إحصائيات الزيارات
  Future<Map<String, dynamic>> getVisitStats() async {
    final visits = await getAllVisits();
    final completedVisits = visits.where((v) => v.status == VisitStatus.checkedOut).toList();
    
    if (completedVisits.isEmpty) {
      return {
        'totalVisits': 0,
        'averageDuration': 0,
        'todayVisits': 0,
        'thisWeekVisits': 0,
      };
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final weekStart = today.subtract(Duration(days: today.weekday - 1));

    final todayVisits = completedVisits
        .where((v) => v.checkInTime.isAfter(today))
        .length;
    
    final weekVisits = completedVisits
        .where((v) => v.checkInTime.isAfter(weekStart))
        .length;

    final totalDuration = completedVisits
        .fold<Duration>(Duration.zero, (sum, visit) => sum + (visit.visitDuration ?? Duration.zero));
    
    final averageDurationMinutes = totalDuration.inMinutes / completedVisits.length;

    return {
      'totalVisits': visits.length,
      'completedVisits': completedVisits.length,
      'averageDuration': averageDurationMinutes.round(),
      'todayVisits': todayVisits,
      'thisWeekVisits': weekVisits,
    };
  }

  // حفظ الزيارة الحالية
  Future<void> _saveCurrentVisit(ClientVisit visit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentVisitKey, json.encode(visit.toJson()));
  }

  // مسح الزيارة الحالية
  Future<void> _clearCurrentVisit() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentVisitKey);
  }

  // إضافة زيارة للسجل
  Future<void> _addVisitToHistory(ClientVisit visit) async {
    final prefs = await SharedPreferences.getInstance();
    final visits = prefs.getStringList(_visitsKey) ?? [];
    visits.add(json.encode(visit.toJson()));
    await prefs.setStringList(_visitsKey, visits);
  }

  // تحديث زيارة في السجل
  Future<void> _updateVisitInHistory(ClientVisit visit) async {
    final prefs = await SharedPreferences.getInstance();
    final visits = prefs.getStringList(_visitsKey) ?? [];
    
    final index = visits.indexWhere((json) {
      final visitMap = jsonDecode(json);
      return visitMap['id'] == visit.id;
    });
    
    if (index != -1) {
      visits[index] = json.encode(visit.toJson());
      await prefs.setStringList(_visitsKey, visits);
    }
  }

  // إلغاء الزيارة الحالية
  Future<void> cancelCurrentVisit({String? reason}) async {
    final currentVisit = await getCurrentVisit();
    if (currentVisit == null) return;

    final cancelledVisit = currentVisit.copyWith(
      status: VisitStatus.cancelled,
      notes: reason ?? currentVisit.notes,
      updatedAt: DateTime.now(),
    );

    await _clearCurrentVisit();
    await _updateVisitInHistory(cancelledVisit);
  }
}