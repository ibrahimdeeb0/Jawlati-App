import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/extensions.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class SelectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String placeholderText;
  final VoidCallback onTap;
  final VoidCallback? onClear;
  final bool isSelected;
  final String? selectedItemName;
  final String? selectedItemSubtitle;
  final String? selectedItemSubtitle2;

  const SelectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.placeholderText,
    required this.onTap,
    this.onClear,
    this.isSelected = false,
    this.selectedItemName,
    this.selectedItemSubtitle,
    this.selectedItemSubtitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderGray.colorWithOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: AppColors.mainBlue),
                    SizedBox(width: 8.w),
                    Text(title, style: AppTextStyles.body18DarkBlueSemiBold),
                  ],
                ),
                if (isSelected)
                  IconButton(
                    onPressed: onClear,
                    icon: Icon(Icons.clear, color: AppColors.gray, size: 20.r),
                  ),
              ],
            ),
            SizedBox(height: 12.h),
            // The Tappable Body
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.mainBlue.colorWithOpacity(0.5)
                        : AppColors.borderGray,
                    style: BorderStyle.solid,
                    width: isSelected ? 2.0 : 1.2,
                  ),
                  color: isSelected
                      ? AppColors.mainBlue.colorWithOpacity(0.05)
                      : null,
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: !isSelected
                      ? _buildPlaceholder()
                      : _buildSelectedContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Placeholder view when nothing is selected
  Widget _buildPlaceholder() {
    return Row(
      key: const ValueKey('placeholder'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, size: 20.r, color: AppColors.gray),
        SizedBox(width: 8.w),
        Text(placeholderText, style: AppTextStyles.body16GrayMedium),
      ],
    );
  }

  // View to display the selected item's details
  Widget _buildSelectedContent() {
    return Column(
      key: const ValueKey('selectedContent'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person_outline_rounded,
                size: 20.r, color: AppColors.mainBlue),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                selectedItemName ?? '',
                style: AppTextStyles.body18LighterBlackSemiBold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (selectedItemSubtitle != null &&
            selectedItemSubtitle!.isNotEmpty) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.phone_outlined, size: 16.r, color: AppColors.gray),
              SizedBox(width: 8.w),
              Text(selectedItemSubtitle!,
                  style: AppTextStyles.caption12GrayMedium),
            ],
          ),
        ],
        if (selectedItemSubtitle2 != null &&
            selectedItemSubtitle2!.isNotEmpty) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 16.r, color: AppColors.gray),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  selectedItemSubtitle2!,
                  style: AppTextStyles.caption12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
