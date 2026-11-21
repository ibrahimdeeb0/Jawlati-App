import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../../data/models/receipt_enums.dart';

class ReceiptsSummaryCard extends StatelessWidget {
  final List<ReceiptVoucherModel> receipts;
  final double totalAmount;
  final int totalCount;

  const ReceiptsSummaryCard({
    super.key,
    required this.receipts,
    required this.totalAmount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final confirmedReceipts = receipts.where((r) => r.status == ReceiptStatus.confirmed).toList();
    final draftReceipts = receipts.where((r) => r.status == ReceiptStatus.draft).toList();
    final cancelledReceipts = receipts.where((r) => r.status == ReceiptStatus.cancelled).toList();
    
    final confirmedAmount = confirmedReceipts.fold(0.0, (sum, receipt) => sum + receipt.amount);
    final draftAmount = draftReceipts.fold(0.0, (sum, receipt) => sum + receipt.amount);

    return SectionCard(
      title: 'ملخص سندات القبض',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  title: 'إجمالي السندات',
                  value: totalCount.toString(),
                  subtitle: DateTimeHelper.formatCurrency(totalAmount),
                  color: AppColors.mainBlue,
                  icon: Icons.receipt_long,
                ),
              ),
              12.spacingHorizontal,
              Expanded(
                child: _buildSummaryItem(
                  title: 'سندات مؤكدة',
                  value: confirmedReceipts.length.toString(),
                  subtitle: DateTimeHelper.formatCurrency(confirmedAmount),
                  color: AppColors.successGreen,
                  icon: Icons.check_circle,
                ),
              ),
            ],
          ),
          16.spacingVertical,
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  title: 'مسودات',
                  value: draftReceipts.length.toString(),
                  subtitle: DateTimeHelper.formatCurrency(draftAmount),
                  color: AppColors.warningOrange,
                  icon: Icons.edit_note,
                ),
              ),
              12.spacingHorizontal,
              Expanded(
                child: _buildSummaryItem(
                  title: 'ملغية',
                  value: cancelledReceipts.length.toString(),
                  subtitle: '0.00 د.أ',
                  color: AppColors.errorRed,
                  icon: Icons.cancel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.colorWithOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: color.colorWithOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.colorWithOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20.sp,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: AppTextStyles.heading20BlackBold.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
          12.spacingVertical,
          Text(
            title,
            style: AppTextStyles.caption12GrayMedium,
          ),
          4.spacingVertical,
          Text(
            subtitle,
            style: AppTextStyles.body14DarkBlueMedium.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}