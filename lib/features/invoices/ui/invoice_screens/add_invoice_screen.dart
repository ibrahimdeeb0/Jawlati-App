import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/models/payment_method.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../data/model/invoice_item/invoice_item.dart';
import '../../logic/invoice_add_cubit/invoice_cubit.dart';
import '../../logic/invoice_add_cubit/invoice_state.dart';
import 'widgets/add_invoice_widgets/client_bottom_sheet_content.dart';
import 'widgets/add_invoice_widgets/client_selector_card.dart';
import 'widgets/add_invoice_widgets/invoice_details_card.dart';
import 'widgets/add_invoice_widgets/invoice_items_table.dart';
import 'widgets/add_invoice_widgets/invoice_summary_card.dart';
import 'widgets/add_invoice_widgets/select_item_bottom_sheet.dart';

class AddInvoiceScreen extends StatelessWidget {
  const AddInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _LoadingView(),
          loading: () => const _LoadingView(),
          loaded:
              (
                currentTime,
                currentDate,
                invoiceItems,
                subtotal,
                totalAmount,
                paidAmount,
                remainingAmount,
                notes,
                selectedClient,
                filteredItems,
                filteredClients,
                selectedPaymentMethod,
                availableMethods,
              ) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    appBar: MyAppBar(
                      title: 'إضافة فاتورة مبيعات',
                      subTitle: currentTime,
                      actions: [
                        if (invoiceItems.isNotEmpty)
                          TextButton(
                            onPressed: () => _showResetConfirmation(context),
                            child: Text(
                              'مسح الكل',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                    body: RefreshIndicator(
                      onRefresh: () async {
                        await context.read<InvoiceCubit>().refreshData();
                      },
                      child: _LoadedView(
                        currentTime: currentTime,
                        currentDate: currentDate,
                        invoiceItems: invoiceItems,
                        subtotal: subtotal,
                        totalAmount: totalAmount,
                        paidAmount: paidAmount,
                        remainingAmount: remainingAmount,
                        notes: notes,
                        selectedClient: selectedClient,
                        paymentMethod: selectedPaymentMethod!,
                      ),
                    ),
                  ),
                );
              },
          error: (message) => _ErrorView(
            message: message,
            onRetry: () => context.read<InvoiceCubit>().refreshData(),
          ),
        );
      },
    );
  }

  void _showResetConfirmation(BuildContext context) {
    final cubit = context.read<InvoiceCubit>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد المسح'),
            content: const Text('هل أنت متأكد من مسح جميع البيانات؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  cubit.resetInvoiceData();
                  Navigator.of(context).pop();
                },
                child: const Text('مسح'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(title: 'إضافة فاتورة مبيعات'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              16.spacingVertical,
              Text(
                'جاري تحميل البيانات...',
                style: AppTextStyles.body16DarkBlueSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ErrorView({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'إضافة فاتورة مبيعات'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 64.r, color: Colors.red),
            16.spacingVertical,
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
            16.spacingVertical,
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final String currentTime;
  final String currentDate;
  final List<InvoiceItem> invoiceItems;
  final double subtotal;
  final double totalAmount;
  final double paidAmount;
  final double remainingAmount;
  final String notes;
  final Client? selectedClient;
  final AppPaymentMethod paymentMethod;

  const _LoadedView({
    required this.currentTime,
    required this.currentDate,
    required this.invoiceItems,
    required this.subtotal,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    required this.notes,
    required this.selectedClient,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InvoiceCubit>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            16.spacingVertical,

            // Client Selection
            ClientSelectorCard(
              onTap: () => _showClientBottomSheet(context, cubit),
            ),

            16.spacingVertical,

            // Invoice Details
            InvoiceDetailsCard(
              onDateChanged: (date) {
                // يمكن إضافة إدارة التاريخ لاحقاً
                // cubit.updateInvoiceDate(date);
              },
              selectedDate: currentDate,
            ),

            16.spacingVertical,

            // Add Item Section
            AddItemCard(
              onAddPressed: () => _showItemBottomSheet(context, cubit),
              onScanBarcode: () => _showItemBottomSheet(context, cubit),
            ),

            // Items Table (only show if items exist)
            if (invoiceItems.isNotEmpty) ...[
              16.spacingVertical,
              InvoiceItemsTable(
                items: invoiceItems,
                onDelete: cubit.removeItemFromInvoice,
                onChangedItemQty: cubit.updateItemQuantity,
                onChangedBonusQty: cubit.updateItemBonusQuantity,
              ),
            ],

            16.spacingVertical,

            // Summary Card (only show if items exist)
            if (invoiceItems.isNotEmpty)
              InvoiceSummaryCard(
                itemCount: invoiceItems.length,
                subtotal: subtotal,
                totalAmount: totalAmount,
                bonusAmount: 12,
                discountAmount: 20,
                taxAmount: 22,
              ),

            20.spacingVertical,

            // Save Button
            SizedBox(
              width: double.infinity,
              child: GradientButton(
                onPressed: _canSaveInvoice() ? cubit.saveInvoice : () async {},
                text: 'حفظ الفاتورة',
                icon: Icons.save,
                enabled: _canSaveInvoice(),
                showLoadingOnPress: true,
              ),
            ),

            26.spacingVertical,
          ],
        ),
      ),
    );
  }

  bool _canSaveInvoice() {
    return invoiceItems.isNotEmpty && selectedClient != null;
  }

  void _showClientBottomSheet(BuildContext context, InvoiceCubit cubit) {
    AppBottomSheet.showCustomModal(
      context: context,
      searchFieldParameters: SearchFieldParameters(
        controller: cubit.clientSearchController,
        hintText: 'ابحث عن عميل',
        onChanged: cubit.searchClients,
        // onClear: cubit.clearClient,
      ),
      title: 'اختيار العميل',
      content: BlocProvider.value(value: cubit, child: SelectClientSheet()),
    );
  }

  void _showItemBottomSheet(BuildContext context, InvoiceCubit cubit) {
    AppBottomSheet.showCustomModal(
      context: context,
      searchFieldParameters: SearchFieldParameters(
        controller: cubit.itemSearchController,
        hintText: 'ابحث عن مادة أو باركود',
        onChanged: cubit.searchItems,
      ),
      title: 'اختيار المادة',
      content: BlocProvider.value(
        value: cubit,
        child: SelectItemBottomSheet(
          onItemSelected: (item) {
            cubit.addItemToInvoice(item);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
