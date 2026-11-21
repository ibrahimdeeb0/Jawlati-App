import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/enums.dart';
import '../../../../logic/invoices_view_cubit/invoices_view_cubit.dart';
import '../../../../logic/invoices_view_cubit/invoices_view_state.dart';

class FilterOptionsBottomSheet extends StatelessWidget {
  const FilterOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesViewCubit, InvoicesViewState>(
      builder: (context, state) {
        final currentFilter = state.maybeWhen(
          loaded: (_, _, _, selectedFilter, _) => selectedFilter,
          orElse: () => InvoiceFilter.all,
        );

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filter Options
                _buildFilterOption(
                  context,
                  title: 'جميع الفواتير',
                  value: InvoiceFilter.all,
                  currentFilter: currentFilter,
                  icon: Icons.receipt_long,
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
    BuildContext context, {
    required String title,
    required InvoiceFilter value,
    required InvoiceFilter currentFilter,
    required IconData icon,
    Color? color,
  }) {
    final isSelected = value == currentFilter;
    final optionColor = color ?? AppColors.mainBlue;

    return InkWell(
      onTap: () {
        context.read<InvoicesViewCubit>().filterInvoices(value);
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? optionColor.colorWithOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? optionColor : AppColors.borderGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: optionColor.colorWithOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: optionColor, size: 20.r),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                color: isSelected ? optionColor : AppColors.darkGray,
              ),
            ),
            const Spacer(),
            if (isSelected) Icon(Icons.check, color: optionColor, size: 20.r),
          ],
        ),
      ),
    );
  }
}
