import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:uuid/uuid.dart';

import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';

import '../../data/repo/receipt_repository.dart';
import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../data/models/receipt_enums.dart';

import 'add_receipt_state.dart';

class AddReceiptCubit extends Cubit<AddReceiptState> {
  final ReceiptRepository _repository;
  final Uuid _uuid = const Uuid();

  AddReceiptCubit(this._repository) : super(const AddReceiptState.initial()) {
    _initialize();
  }

  final AppLogger _logger = AppLogger();
  List<Client> _cachedClients = [];
  final TextEditingController clientSearchController = TextEditingController();

  Future<void> _initialize() async {
    await DateTimeHelper.initialize();
    await _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      emit(const AddReceiptState.loading());

      _cachedClients = await _repository.getAllClients();
      final now = DateTime.now();

      emit(AddReceiptState.loaded(
        currentTime: DateTimeHelper.formatTime(now),
        currentDate: DateTimeHelper.formatShortDate(now),
        amount: 0.0,
        notes: '',
        filteredClients: _cachedClients,
        receiptType: ReceiptType.cash,
      ));
    } catch (e) {
      _logger.error('Error loading initial data: $e');
      emit(AddReceiptState.error('فشل في تحميل البيانات الأولية'));
    }
  }

  void selectClient(Client client) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(selectedClient: client));
    }
  }

  void searchClients(String query) {
    final currentState = state;

    if (_cachedClients.isEmpty) {
      _logger.warning('Clients not loaded yet');
      return;
    }

    if (query.isEmpty) {
      if (currentState is Loaded) {
        emit(currentState.copyWith(filteredClients: _cachedClients));
      }
      return;
    }

    final filtered = _cachedClients
        .where((client) =>
            client.name.toLowerCase().contains(query.toLowerCase()) ||
            client.phone.contains(query))
        .toList();

    if (currentState is Loaded) {
      emit(currentState.copyWith(filteredClients: _cachedClients));
    }
    _logger.info('Filtered ${filtered.length} clients for query: "$query"');
  }

  void updateAmount(double amount) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(amount: amount));
    }
  }

  void updateNotes(String notes) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(notes: notes));
    }
  }

  void selectReceiptType(ReceiptType type) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(currentState.copyWith(
        receiptType: type,
        chequeNumber:
            type == ReceiptType.cheque ? currentState.chequeNumber : null,
        bankName: type == ReceiptType.cheque ? currentState.bankName : null,
        chequeMaturityDate:
            type == ReceiptType.cheque ? currentState.chequeMaturityDate : null,
      ));
    }
  }

  void updateChequeDetails({
    String? chequeNumber,
    String? bankName,
    DateTime? maturityDate,
  }) {
    final currentState = state;
    if (currentState is Loaded &&
        currentState.receiptType == ReceiptType.cheque) {
      emit(currentState.copyWith(
        chequeNumber: chequeNumber ?? currentState.chequeNumber,
        bankName: bankName ?? currentState.bankName,
        chequeMaturityDate: maturityDate ?? currentState.chequeMaturityDate,
      ));
    }
  }

  void filterClients(String query) {
    final currentState = state;
    if (currentState is Loaded && currentState.filteredClients != null) {
      if (query.isEmpty) {
        _loadInitialData();
        return;
      }

      final filtered = currentState.filteredClients!
          .where((client) =>
              client.name.toLowerCase().contains(query.toLowerCase()) ||
              client.phone.contains(query))
          .toList();

      emit(currentState.copyWith(filteredClients: filtered));
    }
  }

  Future<void> saveReceipt() async {
    final currentState = state;
    if (currentState is! Loaded) return;

    if (currentState.selectedClient == null) {
      emit(const AddReceiptState.error('يرجى اختيار العميل'));
      return;
    }

    if (currentState.amount <= 0) {
      emit(const AddReceiptState.error('يرجى إدخال مبلغ صحيح'));
      return;
    }

    if (currentState.receiptType == ReceiptType.cheque) {
      if (currentState.chequeNumber == null ||
          currentState.chequeNumber!.isEmpty) {
        emit(const AddReceiptState.error('يرجى إدخال رقم الشيك'));
        return;
      }
      if (currentState.bankName == null || currentState.bankName!.isEmpty) {
        emit(const AddReceiptState.error('يرجى إدخال اسم البنك'));
        return;
      }
      if (currentState.chequeMaturityDate == null) {
        emit(const AddReceiptState.error('يرجى تحديد تاريخ استحقاق الشيك'));
        return;
      }
    }

    try {
      emit(const AddReceiptState.loading());

      final receipt = ReceiptVoucherModel(
        id: _uuid.v4(),
        receiptNumber: _generateReceiptNumber(),
        client: currentState.selectedClient!,
        receiptType: currentState.receiptType,
        amount: currentState.amount,
        date: DateTime.now(),
        notes: currentState.notes.isNotEmpty ? currentState.notes : null,
        chequeNumber: currentState.chequeNumber,
        bankName: currentState.bankName,
        chequeMaturityDate: currentState.chequeMaturityDate,
        status: ReceiptStatus.confirmed,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _repository.saveReceipt(receipt);

      emit(const AddReceiptState.success('تم حفظ سند القبض بنجاح'));

      // Reset to initial state after success
      await _loadInitialData();
    } catch (e) {
      _logger.error('Error saving receipt: $e');
      emit(const AddReceiptState.error('فشل في حفظ سند القبض'));

      // Return to loaded state
      emit(currentState);
    }
  }

  String _generateReceiptNumber() {
    final now = DateTime.now();
    final dateStr = now.year.toString() +
        now.month.toString().padLeft(2, '0') +
        now.day.toString().padLeft(2, '0');
    final timeStr = now.hour.toString().padLeft(2, '0') +
        now.minute.toString().padLeft(2, '0');
    return 'RCP-$dateStr-$timeStr';
  }

  void resetForm() {
    _loadInitialData();
  }

  List<Client> get allClients => List.unmodifiable(_cachedClients);
}
