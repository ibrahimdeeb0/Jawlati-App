import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';

part 'receipt_details_state.freezed.dart';

@freezed
class ReceiptDetailsState with _$ReceiptDetailsState {
  const factory ReceiptDetailsState.initial() = _Initial;
  
  const factory ReceiptDetailsState.loading() = Loading;
  
  const factory ReceiptDetailsState.loaded({
    required ReceiptVoucherModel receipt,
  }) = Loaded;
  
  const factory ReceiptDetailsState.success(String message) = _Success;
  
  const factory ReceiptDetailsState.error(String message) = Error;
}
