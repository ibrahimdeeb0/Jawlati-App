import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/return_invoice_model/return_invoice_model.dart';

part 'return_invoice_details_state.freezed.dart';

@freezed
class ReturnInvoiceDetailsState with _$ReturnInvoiceDetailsState {
  const factory ReturnInvoiceDetailsState.initial() = _Initial;

  const factory ReturnInvoiceDetailsState.loading() = _Loading;

  const factory ReturnInvoiceDetailsState.loaded({
    required ReturnInvoiceModel returnInvoice,
  }) = _Loaded;

  const factory ReturnInvoiceDetailsState.error(String message) = _Error;
}
