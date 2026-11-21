import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';

class ReceiptHeaderCard extends StatelessWidget {
  final String currentTime;
  final String currentDate;

  const ReceiptHeaderCard({
    super.key,
    required this.currentTime,
    required this.currentDate,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'معلومات سند القبض',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التاريخ',
                    style: AppTextStyles.caption12GrayMedium,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    currentDate,
                    style: AppTextStyles.body14DarkBlueMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الوقت',
                    style: AppTextStyles.caption12GrayMedium,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    currentTime,
                    style: AppTextStyles.body14DarkBlueMedium,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.colorWithOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.mainBlue.colorWithOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 16.sp,
                  color: AppColors.mainBlue,
                ),
                SizedBox(width: 8.w),
                Text(
                  'سند قبض جديد',
                  style: AppTextStyles.caption12GrayMedium.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}