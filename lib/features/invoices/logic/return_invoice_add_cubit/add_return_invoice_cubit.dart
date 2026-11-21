import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../data/model/invoice_item/invoice_item.dart';
import '../../data/model/return_invoice_model/return_invoice_model.dart';
import '../../data/model/return_invoice_item/return_invoice_item.dart';
import '../../data/model/invoice/invoice_model.dart';
import '../../data/model/enums.dart';
import '../../data/repo/return_invoice_repository.dart';
import 'add_return_invoice_state.dart';

class AddReturnInvoiceCubit extends Cubit<AddReturnInvoiceState> {
  final ReturnInvoiceRepository _repository;

  AddReturnInvoiceCubit(this._repository)
      : super(const AddReturnInvoiceState.initial()) {
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      emit(const AddReturnInvoiceState.loading());

      final invoices = await _repository.getOriginalInvoicesForReturn();

      emit(AddReturnInvoiceState.loaded(
        currentTime: _getCurrentTime(),
        currentDate: _getCurrentDate(),
        returnItems: [],
        subtotal: 0.0,
        totalAmount: 0.0,
        refundAmount: 0.0,
        notes: '',
        selectedOriginalInvoice: null,
        availableInvoices: invoices,
        filteredInvoices: invoices,
        returnReason: ReturnReason.customerRequest,
        status: ReturnInvoiceStatus.draft,
      ));
    } catch (e) {
      emit(AddReturnInvoiceState.error(
          'خطأ في تحميل البيانات: ${e.toString()}'));
    }
  }

  void selectOriginalInvoice(InvoiceModel invoice) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          _,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: [], // مسح العناصر عند تغيير الفاتورة
          subtotal: 0.0,
          totalAmount: 0.0,
          refundAmount: 0.0,
          notes: notes,
          selectedOriginalInvoice: invoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void addReturnItem(
      InvoiceItem originalItem, int returnQuantity, String? reason) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        // التحقق من أن الكمية المرتجعة لا تزيد عن الأصلية
        if (returnQuantity > originalItem.quantity) {
          emit(AddReturnInvoiceState.error(
              'الكمية المرتجعة لا يمكن أن تزيد عن الكمية الأصلية'));
          return;
        }

        // التحقق من عدم وجود العنصر مسبقاً
        final existingIndex = returnItems
            .indexWhere((item) => item.itemId == originalItem.itemId);

        List<ReturnInvoiceItem> updatedItems;
        if (existingIndex >= 0) {
          // تحديث العنصر الموجود
          updatedItems = List.from(returnItems);
          updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
            returnedQuantity: returnQuantity,
            returnReason: reason,
          );
        } else {
          // إضافة عنصر جديد
          final returnItem = ReturnInvoiceItem(
            itemId: originalItem.itemId,
            name: originalItem.name,
            unit: originalItem.unit,
            originalPrice: originalItem.price,
            returnedQuantity: returnQuantity,
            originalQuantity: originalItem.quantity,
            returnReason: reason,
          );
          updatedItems = [...returnItems, returnItem];
        }

        final newSubtotal = _calculateSubtotal(updatedItems);

        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: updatedItems,
          subtotal: newSubtotal,
          totalAmount: newSubtotal,
          refundAmount: newSubtotal, // افتراضياً نفس المبلغ
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void removeReturnItem(String itemId) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        final updatedItems =
            returnItems.where((item) => item.itemId != itemId).toList();
        final newSubtotal = _calculateSubtotal(updatedItems);

        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: updatedItems,
          subtotal: newSubtotal,
          totalAmount: newSubtotal,
          refundAmount: newSubtotal,
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void updateReturnQuantity(String itemId, int newQuantity) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        final updatedItems = returnItems.map((item) {
          if (item.itemId == itemId) {
            // التحقق من أن الكمية لا تزيد عن الأصلية
            if (newQuantity > item.originalQuantity) {
              return item;
            }
            return item.copyWith(returnedQuantity: newQuantity);
          }
          return item;
        }).toList();

        final newSubtotal = _calculateSubtotal(updatedItems);

        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: updatedItems,
          subtotal: newSubtotal,
          totalAmount: newSubtotal,
          refundAmount: newSubtotal,
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void updateReturnReason(ReturnReason reason) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          _,
          status) {
        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: returnItems,
          subtotal: subtotal,
          totalAmount: totalAmount,
          refundAmount: refundAmount,
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: reason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void updateNotes(String newNotes) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          _,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: returnItems,
          subtotal: subtotal,
          totalAmount: totalAmount,
          refundAmount: refundAmount,
          notes: newNotes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void updateRefundAmount(double amount) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          _,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) {
        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: returnItems,
          subtotal: subtotal,
          totalAmount: totalAmount,
          refundAmount: amount,
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filteredInvoices,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  void searchInvoices(String query) {
    state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          _,
          returnReason,
          status) {
        final filtered = availableInvoices.where((invoice) {
          return invoice.clientName
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              invoice.invoiceNumber
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ==
                  true;
        }).toList();

        emit(AddReturnInvoiceState.loaded(
          currentTime: currentTime,
          currentDate: currentDate,
          returnItems: returnItems,
          subtotal: subtotal,
          totalAmount: totalAmount,
          refundAmount: refundAmount,
          notes: notes,
          selectedOriginalInvoice: selectedOriginalInvoice,
          availableInvoices: availableInvoices,
          filteredInvoices: filtered,
          returnReason: returnReason,
          status: status,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> saveReturnInvoice() async {
    await state.maybeWhen(
      loaded: (currentTime,
          currentDate,
          returnItems,
          subtotal,
          totalAmount,
          refundAmount,
          notes,
          selectedOriginalInvoice,
          availableInvoices,
          filteredInvoices,
          returnReason,
          status) async {
        if (selectedOriginalInvoice == null || returnItems.isEmpty) {
          emit(const AddReturnInvoiceState.error(
              'يجب اختيار فاتورة أصلية وإضافة عناصر للإرجاع'));
          return;
        }

        try {
          emit(const AddReturnInvoiceState.loading());

          final returnInvoice = ReturnInvoiceModel(
            id: const Uuid().v4(),
            clientId: selectedOriginalInvoice.clientId,
            clientName: selectedOriginalInvoice.clientName,
            originalInvoiceId: selectedOriginalInvoice.id,
            originalInvoiceNumber: selectedOriginalInvoice.invoiceNumber,
            items: returnItems,
            subtotal: subtotal,
            totalAmount: totalAmount,
            refundAmount: refundAmount,
            notes: notes,
            returnReason: returnReason,
            createdAt: DateTime.now(),
            status: ReturnInvoiceStatus.draft,
            returnInvoiceNumber: _generateReturnInvoiceNumber(),
          );

          await _repository.saveReturnInvoice(returnInvoice);

          // إعادة تهيئة البيانات بعد الحفظ
          await _initializeData();
        } catch (e) {
          emit(AddReturnInvoiceState.error(
              'خطأ في حفظ فاتورة المرتجع: ${e.toString()}'));
        }
      },
      orElse: () async {},
    );
  }

  void resetData() {
    _initializeData();
  }

  Future<void> refreshData() async {
    await _initializeData();
  }

  double _calculateSubtotal(List<ReturnInvoiceItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.returnTotal);
  }

  String _generateReturnInvoiceNumber() {
    final now = DateTime.now();
    return 'RET${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.millisecond}';
  }

  String _getCurrentTime() {
    return DateFormat('h:mm a', 'ar').format(DateTime.now());
  }

  String _getCurrentDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }
}
