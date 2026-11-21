import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/enums.dart';
import '../../../../data/model/invoice/invoice_model.dart';
import '../../../../logic/return_invoice_add_cubit/add_return_invoice_cubit.dart';
import '../../../../logic/return_invoice_add_cubit/add_return_invoice_state.dart';

class OriginalInvoiceBottomSheet extends StatefulWidget {
  const OriginalInvoiceBottomSheet({super.key});

  @override
  State<OriginalInvoiceBottomSheet> createState() =>
      _OriginalInvoiceBottomSheetState();
}

class _OriginalInvoiceBottomSheetState
    extends State<OriginalInvoiceBottomSheet> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddReturnInvoiceCubit, AddReturnInvoiceState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded:
              (
                _,
                _,
                _,
                _,
                _,
                _,
                _,
                _,
                availableInvoices,
                filteredInvoices,
                _,
                _,
              ) {
                final displayInvoices = filteredInvoices;

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSearchField(),
                        _buildInvoicesList(displayInvoices),
                      ],
                    ),
                  ),
                );
              },
          orElse: () => SizedBox(
            height: 200.h,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.mainBlue),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: _searchController,
        style: AppTextStyles.body14DarkBlueRegular,
        decoration: InputDecoration(
          hintText: 'البحث في الفواتير...',
          hintStyle: AppTextStyles.body14GrayRegular,
          prefixIcon: Icon(Icons.search, color: AppColors.gray, size: 20.r),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    context.read<AddReturnInvoiceCubit>().searchInvoices('');
                  },
                  icon: Icon(Icons.clear, color: AppColors.gray, size: 20.r),
                )
              : null,
          filled: true,
          fillColor: AppColors.lightBlue.colorWithOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.borderBlue),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        onChanged: (query) {
          context.read<AddReturnInvoiceCubit>().searchInvoices(query);
        },
      ),
    );
  }

  Widget _buildInvoicesList(List<InvoiceModel> invoices) {
    return Flexible(
      child: invoices.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemCount: invoices.length,
              itemBuilder: (context, index) {
                final invoice = invoices[index];
                return _buildInvoiceCard(invoice);
              },
            ),
    );
  }

  Widget _buildInvoiceCard(InvoiceModel invoice) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: () {
          context.read<AddReturnInvoiceCubit>().selectOriginalInvoice(invoice);
          Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'فاتورة رقم: ${invoice.invoiceNumber}',
                    style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                      color: AppColors.mainBlue,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        invoice.status,
                      ).colorWithOpacity(0.1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      _getStatusText(invoice.status),
                      style: AppTextStyles.caption12BlueRegular.copyWith(
                        color: _getStatusColor(invoice.status),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              8.spacingVertical,
              Text(
                'العميل: ${invoice.clientName}',
                style: AppTextStyles.body14GrayRegular,
              ),
              4.spacingVertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المبلغ: ${invoice.totalAmount.toStringAsFixed(2)} د.أ',
                    style: AppTextStyles.body14DarkBlueSemiBold,
                  ),
                  Text(
                    '${invoice.items.length} صنف متنوع',
                    style: AppTextStyles.caption12GrayMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64.r, color: AppColors.gray),
          16.spacingVertical,
          Text(
            'لا توجد فواتير متاحة للإرجاع',
            style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
              color: AppColors.gray,
            ),
          ),
          8.spacingVertical,
          Text(
            'يمكن إرجاع العناصر من الفواتير المدفوعة أو الجزئية فقط',
            style: AppTextStyles.caption12GrayMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.paid:
        return AppColors.successGreen;
      case InvoiceStatus.partial:
        return AppColors.warningOrange;
      case InvoiceStatus.confirmed:
        return AppColors.infoBlue;
      case InvoiceStatus.draft:
        return AppColors.gray;
      case InvoiceStatus.cancelled:
        return AppColors.errorRed;
    }
  }

  String _getStatusText(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.paid:
        return 'مدفوعة';
      case InvoiceStatus.partial:
        return 'جزئية';
      case InvoiceStatus.confirmed:
        return 'مؤكدة';
      case InvoiceStatus.draft:
        return 'مسودة';
      case InvoiceStatus.cancelled:
        return 'ملغية';
    }
  }
}
