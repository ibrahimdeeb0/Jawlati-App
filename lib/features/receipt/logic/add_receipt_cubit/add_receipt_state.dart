import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../data/models/receipt_enums.dart';

part 'add_receipt_state.freezed.dart';

@freezed
class AddReceiptState with _$AddReceiptState {
  const factory AddReceiptState.initial() = _Initial;
  
  const factory AddReceiptState.loading() = Loading;
  
  const factory AddReceiptState.loaded({
    required String currentTime,
    required String currentDate,
    required double amount,
    required String notes,
    Client? selectedClient,
    List<Client>? filteredClients,  
    @Default(ReceiptType.cash) ReceiptType receiptType,
    String? chequeNumber,
    String? bankName,
    DateTime? chequeMaturityDate,
  }) = Loaded;
  
  const factory AddReceiptState.success(String message) = _Success;
  
  const factory AddReceiptState.error(String message) = Error;
}
