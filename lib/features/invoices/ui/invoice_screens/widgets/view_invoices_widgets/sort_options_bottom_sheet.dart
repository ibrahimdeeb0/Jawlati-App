import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/enums.dart';
import '../../../../logic/invoices_view_cubit/invoices_view_cubit.dart';
import '../../../../logic/invoices_view_cubit/invoices_view_state.dart';

class SortOptionsBottomSheet extends StatelessWidget {
  const SortOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesViewCubit, InvoicesViewState>(
      builder: (context, state) {
        final currentSort = state.maybeWhen(
          loaded: (_, _, _, _, sortBy) => sortBy,
          orElse: () => InvoiceSortBy.date,
        );

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sort Options
                _buildSortOption(
                  context,
                  title: 'التاريخ (الأحدث أولاً)',
                  value: InvoiceSortBy.date,
                  currentSort: currentSort,
                  icon: Icons.date_range,
                ),

                _buildSortOption(
                  context,
                  title: 'المبلغ (الأعلى أولاً)',
                  value: InvoiceSortBy.amount,
                  currentSort: currentSort,
                  icon: Icons.attach_money,
                ),

                _buildSortOption(
                  context,
                  title: 'اسم العميل (أبجدياً)',
                  value: InvoiceSortBy.client,
                  currentSort: currentSort,
                  icon: Icons.person,
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSortOption(
    BuildContext context, {
    required String title,
    required InvoiceSortBy value,
    required InvoiceSortBy currentSort,
    required IconData icon,
  }) {
    final isSelected = value == currentSort;

    return InkWell(
      onTap: () {
        context.read<InvoicesViewCubit>().sortInvoices(value);
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainBlue.colorWithOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.borderGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.mainBlue.colorWithOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.mainBlue, size: 20.r),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                color: isSelected ? AppColors.mainBlue : AppColors.darkGray,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(Icons.check, color: AppColors.mainBlue, size: 20.r),
          ],
        ),
      ),
    );
  }
}
