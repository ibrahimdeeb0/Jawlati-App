import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';
import '../../../../data/model/enums.dart';

class InvoicesList extends StatelessWidget {
  final List<InvoiceModel> invoices;
  final Function(InvoiceModel) onInvoicePressed;
  final Function(InvoiceModel)? onInvoiceDeleted;

  const InvoicesList({
    super.key,
    required this.invoices,
    required this.onInvoicePressed,
    this.onInvoiceDeleted,
  });

  @override
  Widget build(BuildContext context) {
    if (invoices.isEmpty) {
      return Container(
        padding: EdgeInsets.all(32.r),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long,
              size: 64.r,
              color: AppColors.gray,
            ),
            SizedBox(height: 16.h),
            Text(
              'لا توجد فواتير تطابق البحث',
              style: AppTextStyles.body16GrayMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: invoices.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return InvoiceCard(
          invoice: invoice,
          onPressed: () => onInvoicePressed(invoice),
          onDeleted: null,
          // onInvoiceDeleted != null
          //     ? () => onInvoiceDeleted!(invoice)
          //     : null,
        );
      },
    );
  }
}

class InvoiceCard extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback onPressed;
  final VoidCallback? onDeleted;

  const InvoiceCard({
    super.key,
    required this.invoice,
    required this.onPressed,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Invoice Number & Date
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.mainBlue.colorWithOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt,
                          color: AppColors.mainBlue,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'رقم الفاتورة: ${invoice.invoiceNumber ?? invoice.id.substring(0, 4)}',
                            style: AppTextStyles.body16DarkBlueSemiBold,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            _formatDate(invoice.createdAt),
                            style: AppTextStyles.caption12GrayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Additional info can be added here if needed
                ],
              ),

              SizedBox(height: 12.h),

              Divider(color: AppColors.borderGray.colorWithOpacity(0.3)),

              SizedBox(height: 12.h),

              // Client & Amount Row
              Row(
                children: [
                  // Client Info
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 16.r,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                invoice.clientName,
                                style: AppTextStyles.body14DarkBlueRegular,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 16.r,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              '${invoice.items.length} مادة',
                              style: AppTextStyles.caption12GrayMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Amount Info
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'المجموع',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          _formatCurrency(invoice.totalAmount),
                          style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                            color: AppColors.mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Payment Method & Actions Row
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Payment Method
                   //TODO Handle displayed method type
                  // Row(
                  //   children: [
                  //     Icon(
                  //       _getPaymentMethodIcon(),
                  //       size: 16.r,
                  //       color: AppColors.gray,
                  //     ),
                  //     SizedBox(width: 6.w),
                  //     Text(
                  //       _getPaymentMethodText(),
                  //       style: AppTextStyles.caption12GrayMedium,
                  //     ),
                  //   ],
                  // ),

                  // Action Buttons
                  Row(
                    children: [
                      // Details Button
                      TextButton.icon(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.visibility_outlined,
                          size: 16.r,
                          color: AppColors.mainBlue,
                        ),
                        label: Text(
                          'التفاصيل',
                          style: AppTextStyles.caption12GrayMedium.copyWith(
                            color: AppColors.mainBlue,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          minimumSize: Size.zero,
                        ),
                      ),

                      // Print Button
                      IconButton(
                        onPressed: () => _printInvoice(),
                        icon: Icon(
                          Icons.print_outlined,
                          size: 20.r,
                          color: AppColors.gray,
                        ),
                        padding: EdgeInsets.all(4.r),
                        constraints: BoxConstraints(
                          minWidth: 32.w,
                          minHeight: 32.h,
                        ),
                      ),

                      // Share Button
                      IconButton(
                        onPressed: () => _shareInvoice(),
                        icon: Icon(
                          Icons.share_outlined,
                          size: 20.r,
                          color: AppColors.gray,
                        ),
                        padding: EdgeInsets.all(4.r),
                        constraints: BoxConstraints(
                          minWidth: 32.w,
                          minHeight: 32.h,
                        ),
                      ),

                      // More Options
                      if (onDeleted != null)
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'delete') {
                              onDeleted!();
                            } else if (value == 'edit') {
                              _editInvoice();
                            } else if (value == 'duplicate') {
                              _duplicateInvoice();
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined,
                                      color: AppColors.mainBlue, size: 18.r),
                                  SizedBox(width: 8.w),
                                  const Text('تعديل'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'duplicate',
                              child: Row(
                                children: [
                                  Icon(Icons.copy_outlined,
                                      color: AppColors.mainOrange, size: 18.r),
                                  SizedBox(width: 8.w),
                                  const Text('نسخ'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete_outline,
                                      color: Colors.red, size: 18.r),
                                  SizedBox(width: 8.w),
                                  const Text('حذف'),
                                ],
                              ),
                            ),
                          ],
                          icon: Icon(
                            Icons.more_vert,
                            size: 20.r,
                            color: AppColors.gray,
                          ),
                          padding: EdgeInsets.all(4.r),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  // IconData _getPaymentMethodIcon() {
  //   switch (invoice.paymentMethod) {
  //     case PaymentMethod.cash:
  //       return Icons.money;
  //     case PaymentMethod.card:
  //       return Icons.credit_card;
  //     case PaymentMethod.later:
  //       return Icons.schedule;
  //     // ignore: unreachable_switch_default
  //     default:
  //       return Icons.payment;
  //   }
  // }

  // String _getPaymentMethodText() {
  //   switch (invoice.paymentMethod) {
  //     case PaymentMethod.cash:
  //       return 'نقداً';
  //     case PaymentMethod.card:
  //       return 'بطاقة';
  //     case PaymentMethod.later:
  //       return 'آجل';
  //     // ignore: unreachable_switch_default
  //     default:
  //       return 'غير محدد';
  //   }
  // }

  String _formatDate(DateTime date) {
    return DateTimeHelper.formatInvoiceDate(date);
  }

  String _formatCurrency(double value) {
    return DateTimeHelper.formatCurrency(value);
  }

  void _printInvoice() {
    // TODO: Implement print functionality
    debugPrint('Print invoice: ${invoice.id}');
  }

  void _shareInvoice() {
    // TODO: Implement share functionality
    debugPrint('Share invoice: ${invoice.id}');
  }

  void _editInvoice() {
    // TODO: Navigate to edit invoice screen
    debugPrint('Edit invoice: ${invoice.id}');
  }

  void _duplicateInvoice() {
    // TODO: Duplicate invoice functionality
    debugPrint('Duplicate invoice: ${invoice.id}');
  }
}
