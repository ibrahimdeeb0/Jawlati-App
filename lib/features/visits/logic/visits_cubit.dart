import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/services/location_service.dart';

import '../data/models/client_visit_model.dart';
import '../data/repo/visits_repository.dart';

part 'visits_state.dart';

enum VisitIssue {
  locationDisabled,
  locationDenied,
  locationDeniedForever,
  locationTimedOut,
  alreadyActive,
  noActiveVisit,
  clientNotFound,
  busy,
  unexpected;

  static VisitIssue fromError(Object error) => switch (error) {
    LocationFailure.disabled => locationDisabled,
    LocationFailure.denied => locationDenied,
    LocationFailure.deniedForever => locationDeniedForever,
    LocationFailure.timedOut => locationTimedOut,
    VisitFailure.alreadyActive => alreadyActive,
    VisitFailure.noActiveVisit => noActiveVisit,
    VisitFailure.clientNotFound => clientNotFound,
    _ => unexpected,
  };
}

class VisitsCubit extends Cubit<VisitsState> {
  VisitsCubit(this._repository) : super(const VisitsState());

  final VisitsRepository _repository;

  Future<void> initialize() async {
    if (state.isBusy) return;
    emit(const VisitsState(isBusy: true));
    try {
      final visit = await _repository.getCurrentVisit();
      if (!isClosed) emit(VisitsState(isReady: true, currentVisit: visit));
    } catch (_) {
      if (!isClosed) emit(const VisitsState(loadFailed: true));
    }
  }

  Future<VisitIssue?> checkIn({
    required String clientId,
    String? purpose,
    String? notes,
  }) => _run(
    () =>
        _repository.checkIn(clientId: clientId, purpose: purpose, notes: notes),
  );

  Future<VisitIssue?> checkOut({String? notes}) => _run(() async {
    await _repository.checkOut(notes: notes);
    return null;
  });

  Future<VisitIssue?> cancelVisit() => _run(() async {
    await _repository.cancelCurrentVisit();
    return null;
  });

  Future<VisitIssue?> _run(Future<ClientVisit?> Function() operation) async {
    final previous = state;
    if (previous.isBusy || !previous.isReady) return VisitIssue.busy;
    emit(
      VisitsState(
        isReady: true,
        isBusy: true,
        currentVisit: previous.currentVisit,
      ),
    );
    try {
      final visit = await operation();
      if (!isClosed) emit(VisitsState(isReady: true, currentVisit: visit));
      return null;
    } catch (error) {
      if (!isClosed) emit(previous);
      return VisitIssue.fromError(error);
    }
  }

  Future<List<ClientVisit>> getAllVisits() => _repository.getAllVisits();
}
