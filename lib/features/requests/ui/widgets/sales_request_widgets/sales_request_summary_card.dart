import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/sales_request_cubit/sales_request_cubit.dart';
import '../../../logic/sales_request_cubit/sales_request_state.dart';

class SalesRequestSummaryCard extends StatelessWidget {
  final double subtotal;
  final double totalAmount;
  final double discount;
  final bool isSubmitting;

  const SalesRequestSummaryCard({
    super.key,
    required this.subtotal,
    required this.totalAmount,
    required this.discount,
    this.isSubmitting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              _buildSummaryRow(
                'المجموع الفرعي',
                '${subtotal.toStringAsFixed(2)} د.أ',
                Icons.receipt_outlined,
              ),
              8.spacingVertical,
              _buildSummaryRow(
                'الخصم',
                '${discount.toStringAsFixed(2)} د.أ',
                Icons.discount_outlined,
              ),
              8.spacingVertical,
              _buildSummaryRow(
                'المجموع الإجمالي',
                '${totalAmount.toStringAsFixed(2)} د.أ',
                Icons.attach_money_outlined,
              ),
              16.spacingVertical,
              GradientButton(
                onPressed: () async {
                  await context.read<SalesRequestCubit>().submitRequest();
                },
                text: 'إنشاء وحفظ الطلب',
                width: double.infinity,
                enabled: _canSubmitRequest(context) && !isSubmitting,
                showLoadingOnPress: true,
              ),
            ],
          ),
          /*  
          BlocBuilder<SalesRequestCubit, SalesRequestState>(
            builder: (context, state) {
              return state.when(
                initial: () => _buildInitialSummary(context),
                loading: () => _buildLoadingSummary(context),
                loaded: (date,
                    items,
                    subtotal,
                    discount,
                    totalAmount,
                    notes,
                    filteredClients,
                    selectedClient,
                    filteredItems,
                    selectedItem) {
                  final canSubmit = selectedClient != null && items.isNotEmpty;
                  return 
                  
                },
                error: (message) => _buildErrorSummary(context),
              );
            },
          ),
         */
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.r,
          color: AppColors.mainOrange,
        ),
        8.spacingHorizontal,
        Text(
          label,
          style: AppTextStyles.body14GrayRegular,
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.body14DarkBlueSemiBold,
        ),
      ],
    );
  }

  bool _canSubmitRequest(BuildContext context) {
    final state = context.read<SalesRequestCubit>().state;
    return state.maybeWhen(
      loaded: (date, items, subtotal, discount, totalAmount, notes,
          filteredClients, selectedClient, filteredItems, selectedItem) {
        return selectedClient != null && items.isNotEmpty;
      },
      orElse: () => false,
    );
  }
}
