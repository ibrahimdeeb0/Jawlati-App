part of 'visits_cubit.dart';

@freezed
class VisitsState with _$VisitsState {
  const factory VisitsState.initial() = _Initial;
  const factory VisitsState.loading() = _Loading;
  const factory VisitsState.loaded({
    ClientVisit? currentVisit,
    required Map<String, dynamic> visitStats,
    String? message,
  }) = _Loaded;
  const factory VisitsState.error(String message) = _Error;
}