import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/request_enums.dart';

part 'requests_state.freezed.dart';

@freezed
class RequestsState with _$RequestsState {
  const factory RequestsState.initial() = _Initial;
  
  const factory RequestsState.loading() = Loading;
  
  const factory RequestsState.loaded({
    required List<dynamic> requests,
    @Default([]) List<dynamic> filteredRequests,
    @Default(null) RequestType? selectedFilter,
    @Default(null) RequestStatus? selectedStatus,
    @Default('') String searchQuery,
  }) = Loaded;
  
  const factory RequestsState.error(String message) = _Error;
}