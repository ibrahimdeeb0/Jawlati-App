import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:jawlati/core/helpers/extensions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../logic/invoice_add_cubit/invoice_cubit.dart';
import '../../../../logic/invoice_add_cubit/invoice_state.dart';

class InvoiceHeaderCard extends StatelessWidget {
  const InvoiceHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          loaded: (
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
            final itemsCount = invoiceItems.length;

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.darkBlue, AppColors.mainBlue],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkBlue.colorWithOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header with icon
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: Colors.white.colorWithOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            color: Colors.white,
                            size: 20.r,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'ملخص الفاتورة',
                          style: AppTextStyles.body18WhiteSemiBold,
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Summary container
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white.colorWithOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.white.colorWithOpacity(0.2),
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildSummaryColumn(
                              'المواد',
                              itemsCount.toString(),
                              Icons.inventory_2,
                            ),
                            _buildDivider(),
                            _buildSummaryColumn(
                              'الإجمالي',
                              _formatCurrency(totalAmount),
                              Icons.account_balance_wallet,
                            ),
                            _buildDivider(),
                            _buildSummaryColumn(
                              'المدفوع',
                              _formatCurrency(paidAmount),
                              Icons.payment,
                            ),
                            _buildDivider(),
                            _buildSummaryColumn(
                              'المتبقي',
                              _formatCurrency(remainingAmount),
                              Icons.schedule,
                              valueColor:
                                  _getRemainingAmountColor(remainingAmount),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Payment status indicator if there are items
                    if (itemsCount > 0) ...[
                      SizedBox(height: 12.h),
                      _buildPaymentStatusIndicator(
                          remainingAmount, totalAmount),
                    ],
                  ],
                ),
              ),
            );
          },
          error: (message) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSummaryColumn(
    String title,
    String value,
    IconData icon, {
    Color? valueColor,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white.colorWithOpacity(0.8),
            size: 16.r,
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
              color: valueColor ?? Colors.white,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: AppTextStyles.caption12GrayMedium.copyWith(
              color: Colors.white.colorWithOpacity(0.8),
              fontSize: 11.sp,
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
      color: Colors.white.colorWithOpacity(0.3),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
    );
  }

  Widget _buildPaymentStatusIndicator(
      double remainingAmount, double totalAmount) {
    final isFullyPaid = remainingAmount <= 0;
    final isPartiallyPaid =
        remainingAmount > 0 && remainingAmount < totalAmount;

    Color indicatorColor;
    String statusText;
    IconData statusIcon;

    if (isFullyPaid) {
      indicatorColor = AppColors.green;
      statusText = 'مدفوع بالكامل';
      statusIcon = Icons.check_circle;
    } else if (isPartiallyPaid) {
      indicatorColor = AppColors.mainOrange;
      statusText = 'مدفوع جزئياً';
      statusIcon = Icons.schedule;
    } else {
      indicatorColor = AppColors.red;
      statusText = 'غير مدفوع';
      statusIcon = Icons.error;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: indicatorColor.colorWithOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: indicatorColor.colorWithOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusIcon,
            size: 14.r,
            color: indicatorColor,
          ),
          SizedBox(width: 6.w),
          Text(
            statusText,
            style: AppTextStyles.caption12GrayMedium.copyWith(
              color: indicatorColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getRemainingAmountColor(double remainingAmount) {
    if (remainingAmount <= 0) {
      return AppColors.green;
    } else if (remainingAmount > 0) {
      return AppColors.mainOrange;
    }
    return Colors.white;
  }

  String _formatCurrency(double value) {
    final formatter = intl.NumberFormat("#,##0.00", "ar");
    return formatter.format(value);
  }
}
