import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime timestamp;
  final IconData icon;
  final Color iconColor;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.icon,
    required this.iconColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: iconColor.colorWithOpacity(0.1),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: iconColor, width: 2),
              ),
              child: Icon(
                icon,
                size: 16.r,
                color: iconColor,
              ),
            ),
            if (!isLast)
              Container(
                width: 2.w,
                height: 40.h,
                color: AppColors.borderGray,
                margin: EdgeInsets.symmetric(vertical: 4.h),
              ),
          ],
        ),

        16.spacingHorizontal,

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body14DarkBlueSemiBold,
              ),
              4.spacingVertical,
              Text(
                subtitle,
                style: AppTextStyles.caption12GrayMedium,
              ),
              4.spacingVertical,
              Text(
                _formatTimestamp(timestamp),
                style: AppTextStyles.caption12BlueRegular.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimestamp(DateTime dateTime) {
    // This would use DateTimeHelper in the actual implementation
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
