import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/enums.dart';
import '../../../../data/model/invoice/invoice_model.dart';

class OriginalInvoiceSelectorCard extends StatelessWidget {
  final InvoiceModel? selectedInvoice;
  final VoidCallback onTap;

  const OriginalInvoiceSelectorCard({
    super.key,
    required this.selectedInvoice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.receipt_long,
                      color: AppColors.mainBlue,
                      size: 20.r,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      'اختيار الفاتورة الأصلية',
                      style: AppTextStyles.body16DarkBlueSemiBold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.gray,
                  ),
                ],
              ),
              if (selectedInvoice != null) ...[
                12.spacingVertical,
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.borderGray),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'رقم الفاتورة: ${selectedInvoice!.invoiceNumber}',
                            style:
                                AppTextStyles.body14DarkBlueSemiBold.copyWith(
                              color: AppColors.mainBlue,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: _getStatusColor(selectedInvoice!.status)
                                  .colorWithOpacity(0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              _getStatusText(selectedInvoice!.status),
                              style:
                                  AppTextStyles.caption12BlueRegular.copyWith(
                                color: _getStatusColor(selectedInvoice!.status),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.spacingVertical,
                      Text(
                        'العميل: ${selectedInvoice!.clientName}',
                        style: AppTextStyles.body14GrayRegular,
                      ),
                      4.spacingVertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'المبلغ الإجمالي: ${selectedInvoice!.totalAmount.toStringAsFixed(2)} د.أ',
                            style: AppTextStyles.body14DarkBlueSemiBold,
                          ),
                          Text(
                            '${selectedInvoice!.items.length} صنف متنوع',
                            style: AppTextStyles.caption12GrayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else ...[
                12.spacingVertical,
                Text(
                  'اضغط لاختيار الفاتورة التي تريد إرجاع عناصر منها',
                  style: AppTextStyles.body14GrayRegular,
                ),
              ],
            ],
          ),
        ),
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
