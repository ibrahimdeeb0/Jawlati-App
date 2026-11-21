import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';

class InvoicesSummaryCard extends StatelessWidget {
  final List<InvoiceModel> invoices;

  const InvoicesSummaryCard({
    super.key,
    required this.invoices,
  });

  @override
  Widget build(BuildContext context) {
    final totalAmount =
        invoices.fold<double>(0, (sum, invoice) => sum + invoice.totalAmount);
    final totalItems =
        invoices.fold<int>(0, (sum, invoice) => sum + invoice.items.length);

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkBlue, AppColors.mainBlue],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBlue.colorWithOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem(
                title: 'المواد',
                value: totalItems.toString(),
                icon: Icons.inventory,
                color: Colors.orange,
              ),
              _buildDivider(),
              _buildSummaryItem(
                title: 'الإجمالي',
                value: _formatCurrency(totalAmount),
                icon: Icons.receipt_long,
                color: Colors.white,
              ),
              _buildDivider(),
              _buildSummaryItem(
                title: 'الفواتير',
                value: invoices.length.toString(),
                icon: Icons.description,
                color: Colors.green,
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
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: color.colorWithOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20.r,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: AppTextStyles.body16WhiteSemiBold.copyWith(
              fontSize: 16.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: AppTextStyles.caption12GrayMedium.copyWith(
              color: Colors.white70,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40.h,
      color: Colors.white.colorWithOpacity(0.2),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
    );
  }

  String _formatCurrency(double value) {
    final formatter = NumberFormat('#,##0.00', 'ar');
    return '${formatter.format(value)} د.أ';
  }
}
