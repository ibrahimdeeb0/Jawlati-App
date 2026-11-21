import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../../data/models/receipt_enums.dart';

class ReceiptCard extends StatelessWidget {
  final ReceiptVoucherModel receipt;
  final VoidCallback onPressed;
  final VoidCallback onDeleted;

  const ReceiptCard({
    super.key,
    required this.receipt,
    required this.onPressed,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.colorWithOpacity(0.05),
              offset: const Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: _getTypeColor().colorWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: _getTypeColor().colorWithOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getTypeIcon(),
                        size: 14.sp,
                        color: _getTypeColor(),
                      ),
                      6.spacingHorizontal,
                      Text(
                        receipt.receiptType.displayName,
                        style: AppTextStyles.caption12GrayMedium.copyWith(
                          color: _getTypeColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor().colorWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    receipt.status.displayName,
                    style: AppTextStyles.caption13GrayMedium.copyWith(
                      color: _getStatusColor(),
                    ),
                  ),
                ),
                8.spacingHorizontal,
                // _buildActionMenu(context),
              ],
            ),

            16.spacingVertical,

            // Receipt Number and Date
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سند قبض رقم',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                      4.spacingVertical,
                      Text(
                        receipt.receiptNumber,
                        style: AppTextStyles.body14DarkBlueSemiBold,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'التاريخ',
                      style: AppTextStyles.caption12GrayMedium,
                    ),
                    4.spacingVertical,
                    Text(
                      DateTimeHelper.formatShortDate(receipt.date),
                      style: AppTextStyles.body14DarkBlueMedium,
                    ),
                  ],
                ),
              ],
            ),

            16.spacingVertical,

            // Client Info
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 16.sp,
                    color: AppColors.mainBlue,
                  ),
                ),
                12.spacingHorizontal,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receipt.client.name,
                        style: AppTextStyles.body14DarkBlueMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      2.spacingVertical,
                      Text(
                        receipt.client.phone,
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            16.spacingVertical,

            // Amount and Cheque Details (if applicable)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المبلغ',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                      4.spacingVertical,
                      Text(
                        DateTimeHelper.formatCurrency(receipt.amount),
                        style: AppTextStyles.heading20BlackBold.copyWith(
                          color: AppColors.successGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                if (receipt.receiptType == ReceiptType.cheque &&
                    receipt.chequeNumber != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'رقم الشيك',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                      4.spacingVertical,
                      Text(
                        receipt.chequeNumber!,
                        style: AppTextStyles.body14DarkBlueMedium,
                      ),
                    ],
                  ),
              ],
            ),

            // Notes (if any)
            if (receipt.notes != null && receipt.notes!.isNotEmpty) ...[
              16.spacingVertical,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.extraLightGray,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ملاحظات:',
                      style: AppTextStyles.caption12GrayMedium,
                    ),
                    4.spacingVertical,
                    Text(
                      receipt.notes!,
                      style: AppTextStyles.body14DarkBlueMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildActionMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: AppColors.gray,
        size: 20.sp,
      ),
      onSelected: (value) {
        switch (value) {
          case 'delete':
            onDeleted();
            break;
          case 'edit':
            // TODO: Navigate to edit
            break;
          case 'print':
            // TODO: Print receipt
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'print',
          child: ListTile(
            leading: Icon(Icons.print),
            title: Text('طباعة'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        const PopupMenuItem(
          value: 'edit',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('تعديل'),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('حذف', style: TextStyle(color: Colors.red)),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (receipt.status) {
      case ReceiptStatus.confirmed:
        return AppColors.successGreen;
      case ReceiptStatus.draft:
        return AppColors.warningOrange;
      case ReceiptStatus.cancelled:
        return AppColors.errorRed;
    }
  }

  Color _getTypeColor() {
    switch (receipt.receiptType) {
      case ReceiptType.cash:
        return AppColors.successGreen;
      case ReceiptType.cheque:
        return AppColors.mainBlue;
      case ReceiptType.bankTransfer:
        return AppColors.mainOrange;
      case ReceiptType.creditCard:
        return AppColors.darkBlue;
      case ReceiptType.other:
        return AppColors.gray;
    }
  }

  IconData _getTypeIcon() {
    switch (receipt.receiptType) {
      case ReceiptType.cash:
        return Icons.payments;
      case ReceiptType.cheque:
        return Icons.receipt_long;
      case ReceiptType.bankTransfer:
        return Icons.account_balance;
      case ReceiptType.creditCard:
        return Icons.credit_card;
      case ReceiptType.other:
        return Icons.more_horiz;
    }
  }
}
