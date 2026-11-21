import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import 'package:jawlati/core/widgets/index.dart';

import '../../data/model/invoice/invoice_model.dart';
import '../../data/model/return_invoice_item/return_invoice_item.dart';
import '../../data/model/enums.dart';
import '../../logic/return_invoice_add_cubit/add_return_invoice_cubit.dart';
import '../../logic/return_invoice_add_cubit/add_return_invoice_state.dart';
import 'widgets/return_invoice_add_widgets/add_return_item_bottom_sheet.dart';
import 'widgets/return_invoice_add_widgets/original_invoice_bottom_sheet.dart';
import 'widgets/return_invoice_add_widgets/original_invoice_selector_card.dart';
import 'widgets/return_invoice_add_widgets/return_details_card.dart';
import 'widgets/return_invoice_add_widgets/return_items_table.dart';
import 'widgets/return_invoice_add_widgets/return_summary_card.dart';

class AddReturnInvoiceScreen extends StatelessWidget {
  const AddReturnInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddReturnInvoiceCubit, AddReturnInvoiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _LoadingView(),
          loading: () => const _LoadingView(),
          loaded:
              (
                currentTime,
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
                status,
              ) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    appBar: MyAppBar(
                      title: 'إضافة فاتورة مرتجع',
                      subTitle: currentTime,
                      actions: [
                        if (returnItems.isNotEmpty)
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
                        await context
                            .read<AddReturnInvoiceCubit>()
                            .refreshData();
                      },
                      child: _LoadedView(
                        currentTime: currentTime,
                        currentDate: currentDate,
                        returnItems: returnItems,
                        subtotal: subtotal,
                        totalAmount: totalAmount,
                        refundAmount: refundAmount,
                        notes: notes,
                        selectedOriginalInvoice: selectedOriginalInvoice,
                        returnReason: returnReason,
                        status: status,
                      ),
                    ),
                  ),
                );
              },
          error: (message) => _ErrorView(
            message: message,
            onRetry: () => context.read<AddReturnInvoiceCubit>().refreshData(),
          ),
        );
      },
    );
  }

  void _showResetConfirmation(BuildContext context) {
    final cubit = context.read<AddReturnInvoiceCubit>();
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
                  cubit.resetData();
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
        appBar: MyAppBar(title: 'إضافة فاتورة مرتجع'),
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final String currentTime;
  final String currentDate;
  final List<ReturnInvoiceItem> returnItems;
  final double subtotal;
  final double totalAmount;
  final double refundAmount;
  final String notes;
  final InvoiceModel? selectedOriginalInvoice;
  final ReturnReason returnReason;
  final ReturnInvoiceStatus status;

  const _LoadedView({
    required this.currentTime,
    required this.currentDate,
    required this.returnItems,
    required this.subtotal,
    required this.totalAmount,
    required this.refundAmount,
    required this.notes,
    required this.selectedOriginalInvoice,
    required this.returnReason,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddReturnInvoiceCubit>();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              16.spacingVertical,

              // Warning Card
              _buildWarningCard(),

              16.spacingVertical,

              // Original Invoice Selection
              OriginalInvoiceSelectorCard(
                selectedInvoice: selectedOriginalInvoice,
                onTap: () => _showOriginalInvoiceBottomSheet(context, cubit),
              ),

              // Return Details (only show if invoice is selected)
              if (selectedOriginalInvoice != null) ...[
                16.spacingVertical,
                ReturnDetailsCard(
                  selectedDate: currentDate,
                  selectedReason: returnReason,
                  onReasonChanged: cubit.updateReturnReason,
                  onAddItemPressed: () =>
                      _showAddReturnItemBottomSheet(context, cubit),
                ),
              ],

              // Return Items Table (only show if items exist)
              if (returnItems.isNotEmpty) ...[
                16.spacingVertical,
                ReturnItemsTable(
                  items: returnItems,
                  onDelete: cubit.removeReturnItem,
                  onQuantityChanged: cubit.updateReturnQuantity,
                ),

                // Items Summary
                8.spacingVertical,
                _buildItemsSummaryCard(),
              ],

              // Return Summary (only show if items exist)
              if (returnItems.isNotEmpty) ...[
                8.spacingVertical,
                ReturnSummaryCard(
                  subtotal: subtotal,
                  totalAmount: totalAmount,
                  refundAmount: refundAmount,
                  notes: notes,
                  onRefundChanged: cubit.updateRefundAmount,
                  onNotesChanged: cubit.updateNotes,
                ),
              ],

              20.spacingVertical,

              // Save Button
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  onPressed: _canSaveReturnInvoice()
                      ? () => _saveReturnInvoice(context, cubit)
                      : () async {},
                  text: 'حفظ فاتورة المرتجع',
                  icon: Icons.assignment_return,
                  enabled: _canSaveReturnInvoice(),
                  showLoadingOnPress: true,
                ),
              ),

              // Bottom spacing for better UX
              26.spacingVertical,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWarningCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.orange.colorWithOpacity(0.1),
        border: Border.all(color: Colors.orange.colorWithOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.orange, size: 20.r),
          12.horizontalSpace,
          Expanded(
            child: Text(
              'فاتورة المرتجع تؤثر على المخزون والحسابات. تأكد من صحة البيانات قبل الحفظ.',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsSummaryCard() {
    final unitGroups = <String, int>{};

    for (final item in returnItems) {
      unitGroups[item.unit] =
          (unitGroups[item.unit] ?? 0) + item.returnedQuantity;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.blue.colorWithOpacity(0.05),
        border: Border.all(color: Colors.blue.colorWithOpacity(0.2)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.inventory_2_outlined, color: Colors.blue, size: 18.r),
          8.horizontalSpace,
          Text(
            'إجمالي المرتجعات: ',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Text(
              unitGroups.entries
                  .map((entry) => '${entry.value} ${entry.key}')
                  .join(' + '),
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canSaveReturnInvoice() {
    return selectedOriginalInvoice != null && returnItems.isNotEmpty;
  }

  void _showOriginalInvoiceBottomSheet(
    BuildContext context,
    AddReturnInvoiceCubit cubit,
  ) {
    AppBottomSheet.showModal(
      context: context,
      title: 'اختر الفاتورة الأصلية',
      content: BlocProvider.value(
        value: cubit,
        child: const OriginalInvoiceBottomSheet(),
      ),
    );
  }

  void _showAddReturnItemBottomSheet(
    BuildContext context,
    AddReturnInvoiceCubit cubit,
  ) {
    if (selectedOriginalInvoice == null) return;

    AppBottomSheet.showModal(
      context: context,
      title: 'اختيار عنصر للإرجاع',
      content: BlocProvider.value(
        value: cubit,
        child: AddReturnItemBottomSheet(
          originalInvoice: selectedOriginalInvoice!,
        ),
      ),
    );
  }

  Future<void> _saveReturnInvoice(
    BuildContext context,
    AddReturnInvoiceCubit cubit,
  ) async {
    if (!_canSaveReturnInvoice()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('يجب اختيار فاتورة أصلية وإضافة عناصر للإرجاع'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
      return;
    }

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الحفظ'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('هل أنت متأكد من حفظ فاتورة المرتجع؟'),
                16.spacingVertical,
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ملخص الفاتورة:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.spacingVertical,
                      Text(
                        '• الفاتورة الأصلية: ${selectedOriginalInvoice?.invoiceNumber}',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      Text(
                        '• عدد العناصر المرتجعة: ${returnItems.length}',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      Text(
                        '• المبلغ المسترد: ${refundAmount.toStringAsFixed(2)} د.أ',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('حفظ'),
              ),
            ],
          ),
        );
      },
    );

    if (confirmed == true) {
      try {
        await cubit.saveReturnInvoice();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  8.horizontalSpace,
                  const Text('تم حفظ فاتورة المرتجع بنجاح'),
                ],
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          );

          Navigator.of(context).pop();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('فشل في حفظ فاتورة المرتجع: ${e.toString()}'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          );
        }
      }
    }
  }
}
