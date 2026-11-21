import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../data/models/receipt_enums.dart';

part 'view_receipts_state.freezed.dart';

@freezed
class ViewReceiptsState with _$ViewReceiptsState {
  const factory ViewReceiptsState.initial() = _Initial;
  
  const factory ViewReceiptsState.loading() = Loading;
  
  const factory ViewReceiptsState.loaded({
    required List<ReceiptVoucherModel> receipts,
    required List<ReceiptVoucherModel> filteredReceipts,
    required double totalAmount,
    required int totalCount,
    @Default(ReceiptFilter.all) ReceiptFilter selectedFilter,
    @Default(ReceiptSortBy.date) ReceiptSortBy selectedSort,
    @Default('') String searchQuery,
  }) = Loaded;
  
  const factory ViewReceiptsState.error(String message) = Error;
}
