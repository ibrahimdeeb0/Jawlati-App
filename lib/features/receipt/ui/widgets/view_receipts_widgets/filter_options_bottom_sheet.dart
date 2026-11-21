import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_enums.dart';
import '../../../logic/view_receipts_cubit/view_receipts_cubit.dart';
import '../../../logic/view_receipts_cubit/view_receipts_state.dart';

class FilterOptionsBottomSheet extends StatelessWidget {
  const FilterOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewReceiptsCubit, ViewReceiptsState>(
      builder: (context, state) {
        final selectedFilter = state.maybeWhen(
          loaded: (_, __, ___, ____, selectedFilter, _____, ______) =>
              selectedFilter,
          orElse: () => ReceiptFilter.all,
        );

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                16.spacingVertical,

                // Options
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      ...ReceiptFilter.values.map(
                        (filter) => _buildFilterOption(
                          context,
                          filter,
                          selectedFilter == filter,
                        ),
                      ),
                      32.spacingVertical,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    ReceiptFilter filter,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<ViewReceiptsCubit>().applyFilter(filter);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainBlue.colorWithOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.lightGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.mainBlue : AppColors.gray,
              size: 20.sp,
            ),
            12.spacingHorizontal,
            Expanded(
              child: Text(
                filter.displayName,
                style: AppTextStyles.body14DarkBlueMedium.copyWith(
                  color: isSelected ? AppColors.mainBlue : AppColors.darkGray,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: AppColors.mainBlue, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
