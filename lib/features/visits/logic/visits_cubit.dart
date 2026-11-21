import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import '../data/models/client_visit_model.dart';
import '../data/repo/visits_repository.dart';

part 'visits_cubit.freezed.dart';
part 'visits_state.dart';

class VisitsCubit extends Cubit<VisitsState> {
  final VisitsRepository _visitsRepository;

  VisitsCubit(this._visitsRepository) : super(const VisitsState.initial());

  // تحميل الحالة الأولية
  Future<void> initialize() async {
    emit(const VisitsState.loading());
    try {
      final currentVisit = await _visitsRepository.getCurrentVisit();
      final stats = await _visitsRepository.getVisitStats();

      emit(VisitsState.loaded(currentVisit: currentVisit, visitStats: stats));
    } catch (e) {
      emit(VisitsState.error(e.toString()));
    }
  }

  // بدء زيارة جديدة
  Future<void> checkIn({
    required String clientId,
    required String clientName,
    required String salesmanId,
    String? salesmanName,
    String? purpose,
    String? notes,
  }) async {
    emit(const VisitsState.loading());
    try {
      final visit = await _visitsRepository.checkIn(
        clientId: clientId,
        clientName: clientName,
        salesmanId: salesmanId,
        salesmanName: salesmanName,
        purpose: purpose,
        notes: notes,
      );

      // تحديث الإحصائيات
      final stats = await _visitsRepository.getVisitStats();

      emit(
        VisitsState.loaded(
          currentVisit: visit,
          visitStats: stats,
          message: 'تم بدء الزيارة بنجاح',
        ),
      );
    } catch (e) {
      AppLogger().debug(e.toString());
      emit(VisitsState.error(e.toString()));
      // إعادة تحميل البيانات بعد الخطأ
      await initialize();
    }
  }

  // إنهاء الزيارة
  Future<void> checkOut({String? notes, List<String>? attachments}) async {
    emit(const VisitsState.loading());
    try {
      final visit = await _visitsRepository.checkOut(
        notes: notes,
        attachments: attachments,
      );

      // تحديث الإحصائيات
      final stats = await _visitsRepository.getVisitStats();

      emit(
        VisitsState.loaded(
          currentVisit: null,
          visitStats: stats,
          message: 'تم إنهاء الزيارة بنجاح',
        ),
      );
    } catch (e) {
      emit(VisitsState.error(e.toString()));
      // إعادة تحميل البيانات بعد الخطأ
      await initialize();
    }
  }

  // إلغاء الزيارة
  Future<void> cancelVisit({String? reason}) async {
    emit(const VisitsState.loading());
    try {
      await _visitsRepository.cancelCurrentVisit(reason: reason);

      // تحديث الإحصائيات
      final stats = await _visitsRepository.getVisitStats();

      emit(
        VisitsState.loaded(
          currentVisit: null,
          visitStats: stats,
          message: 'تم إلغاء الزيارة',
        ),
      );
    } catch (e) {
      emit(VisitsState.error(e.toString()));
    }
  }

  // الحصول على سجل الزيارات
  Future<List<ClientVisit>> getAllVisits() async {
    return await _visitsRepository.getAllVisits();
  }

  // الحصول على زيارات عميل محدد
  Future<List<ClientVisit>> getClientVisits(String clientId) async {
    return await _visitsRepository.getClientVisits(clientId);
  }

  // تحديث الحالة فقط
  void refreshState() {
    initialize();
  }
}
