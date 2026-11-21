part of 'visits_cubit.dart';

class VisitsState {
  const VisitsState({
    this.currentVisit,
    this.isBusy = false,
    this.isReady = false,
    this.loadFailed = false,
  });

  final ClientVisit? currentVisit;
  final bool isBusy;
  final bool isReady;
  final bool loadFailed;
}
