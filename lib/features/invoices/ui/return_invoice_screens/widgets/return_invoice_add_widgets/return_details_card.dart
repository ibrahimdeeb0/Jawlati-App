import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/enums.dart';

class ReturnDetailsCard extends StatelessWidget {
  final String selectedDate;
  final ReturnReason selectedReason;
  final Function(ReturnReason) onReasonChanged;
  final VoidCallback onAddItemPressed;

  const ReturnDetailsCard({
    super.key,
    required this.selectedDate,
    required this.selectedReason,
    required this.onReasonChanged,
    required this.onAddItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تفاصيل المرتجع',
              style: AppTextStyles.body16DarkBlueSemiBold,
            ),

            16.spacingVertical,

            // التاريخ
            Row(
              children: [
                Icon(Icons.calendar_today, size: 20.r, color: AppColors.gray),
                12.horizontalSpace,
                Text(
                  'تاريخ المرتجع: $selectedDate',
                  style: AppTextStyles.body14DarkBlueRegular,
                ),
              ],
            ),

            16.spacingVertical,

            // سبب المرتجع
            Text(
              'سبب المرتجع',
              style: AppTextStyles.body14DarkBlueSemiBold,
            ),
            8.spacingVertical,
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderGray),
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundPrimary,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ReturnReason>(
                  value: selectedReason,
                  isExpanded: true,
                  style: AppTextStyles.body14DarkBlueRegular,
                  dropdownColor: AppColors.backgroundPrimary,
                  items: ReturnReason.values.map((reason) {
                    return DropdownMenuItem(
                      value: reason,
                      child: Text(
                        reason.displayName,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.body14DarkBlueRegular,
                      ),
                    );
                  }).toList(),
                  onChanged: (reason) {
                    if (reason != null) onReasonChanged(reason);
                  },
                ),
              ),
            ),

            16.spacingVertical,

            // زر إضافة عناصر
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAddItemPressed,
                icon: Icon(Icons.add, color: AppColors.textInverse),
                label: Text(
                  'إضافة عناصر للإرجاع',
                  style: AppTextStyles.button16WhiteSemiBold,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
