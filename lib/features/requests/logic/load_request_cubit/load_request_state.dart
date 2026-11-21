import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/features/invoices/data/model/item/item_model.dart';
import '../../data/models/request_item/request_item.dart';

part 'load_request_state.freezed.dart';

@freezed
class LoadRequestState with _$LoadRequestState {
  const factory LoadRequestState.initial() = _Initial;

  const factory LoadRequestState.loading() = Loading;

  const factory LoadRequestState.loaded({
    required DateTime date,
    required List<RequestItem> requestItems,
    @Default('') String notes,
    List<ItemModel>? filteredItems,
  }) = Loaded;

  const factory LoadRequestState.error(String message) = _Error;

  const factory LoadRequestState.submissionInProgress() = _SubmissionInProgress;
  const factory LoadRequestState.submissionSuccess() = _SubmissionSuccess;
  const factory LoadRequestState.submissionFailure(String error) =
      _SubmissionFailure;
}
