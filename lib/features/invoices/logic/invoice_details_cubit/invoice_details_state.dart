import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/invoice/invoice_model.dart';

part 'invoice_details_state.freezed.dart';

@freezed
class InvoiceDetailsState with _$InvoiceDetailsState {
  const factory InvoiceDetailsState.initial() = _Initial;

  const factory InvoiceDetailsState.loading() = _Loading;

  const factory InvoiceDetailsState.loaded(InvoiceModel invoice) = _Loaded;

  const factory InvoiceDetailsState.error(String message) = _Error;
}
