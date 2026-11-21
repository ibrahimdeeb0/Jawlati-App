import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class SortOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isAscending;
  final VoidCallback onTap;

  const SortOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.isAscending,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBlue : AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.borderGray,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.mainBlue : AppColors.gray,
              size: 20.r,
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.body14DarkBlueRegular.copyWith(
                  color: isSelected ? AppColors.mainBlue : AppColors.darkBlue,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                color: AppColors.mainBlue,
                size: 16.r,
              ),
          ],
        ),
      ),
    );
  }
}
