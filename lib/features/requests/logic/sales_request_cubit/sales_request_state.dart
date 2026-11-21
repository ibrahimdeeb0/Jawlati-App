import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:jawlati/features/invoices/data/model/item/item_model.dart';
import '../../data/models/request_item/request_item.dart';

part 'sales_request_state.freezed.dart';

@freezed
class SalesRequestState with _$SalesRequestState {
  const factory SalesRequestState.initial() = _Initial;

  const factory SalesRequestState.loading() = _Loading;

  const factory SalesRequestState.loaded({
    required DateTime date,
    @Default([]) List<RequestItem> items,
    @Default(0.0) double subtotal,
    @Default(0.0) double discount,
    @Default(0.0) double totalAmount,
    @Default('') String notes,
    List<Client>? filteredClients,
    Client? selectedClient,
    List<ItemModel>? filteredItems,
    ItemModel? selectedItem,
  }) = Loaded;

  const factory SalesRequestState.error(String message) = _Error;

  const factory SalesRequestState.submissionInProgress() =
      _SubmissionInProgress;
  const factory SalesRequestState.submissionSuccess() = _SubmissionSuccess;
  const factory SalesRequestState.submissionFailure(String error) =
      _SubmissionFailure;
}
