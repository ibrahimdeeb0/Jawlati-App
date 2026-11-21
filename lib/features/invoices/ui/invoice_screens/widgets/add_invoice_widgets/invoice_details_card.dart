import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/displays/payment_method_selector.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_cubit.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_state.dart';

class InvoiceDetailsCard extends StatelessWidget {
  final String selectedDate;
  final void Function(DateTime) onDateChanged;

  const InvoiceDetailsCard({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => SizedBox.shrink(),
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
              ) => Container(
                padding: EdgeInsetsDirectional.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.backgroundPrimary,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.borderGray.colorWithOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.mainOrange,
                        ),
                        8.spacingVertical,
                        Text(
                          'تفاصيل الفاتورة',
                          style: AppTextStyles.body18DarkBlueSemiBold,
                        ),
                      ],
                    ),
                    16.spacingVertical,

                    // Date Section
                    Text('التاريخ', style: AppTextStyles.body14DarkBlueRegular),
                    8.spacingVertical,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.borderGray),
                        color: AppColors.backgroundPrimary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 20.r,
                            color: AppColors.gray,
                          ),
                          8.spacingHorizontal,
                          Text(
                            selectedDate,
                            style: AppTextStyles.body16GrayMedium,
                          ),
                        ],
                      ),
                    ),

                    if (selectedClient != null) ...[
                      20.spacingVertical,
                      Text(
                        'اختر طريقة الدفع',
                        style: AppTextStyles.body14DarkBlueRegular,
                      ),
                      8.spacingVertical,
                      PaymentMethodSelector(
                        availableMethods: availableMethods,
                        selectedMethod: selectedPaymentMethod,
                        onMethodSelected: context
                            .read<InvoiceCubit>()
                            .updatePaymentMethod,
                      ),
                    ],
                  ],
                ),
              ),
        );
      },
    );
  }
}
