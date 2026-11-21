import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class SummaryStatsCard extends StatelessWidget {
  final List<StatItem> stats;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const SummaryStatsCard({
    super.key,
    required this.stats,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: backgroundColor ?? AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: padding ?? EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ملخص إحصائي',
              style: AppTextStyles.body16DarkBlueSemiBold,
            ),
            16.spacingVertical,
            ...stats.asMap().entries.map((entry) {
              final index = entry.key;
              final stat = entry.value;
              return Column(
                children: [
                  _buildStatRow(stat),
                  if (index < stats.length - 1) 8.spacingVertical,
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(StatItem stat) {
    return Row(
      children: [
        if (stat.icon != null) ...[
          Icon(
            stat.icon,
            size: 16.r,
            color: stat.color ?? AppColors.mainBlue,
          ),
          8.horizontalSpace,
        ],
        Expanded(
          child: Text(
            stat.label,
            style: AppTextStyles.body14GrayRegular,
          ),
        ),
        Text(
          stat.value,
          style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
            color: stat.color ?? AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}

class StatItem {
  final String label;
  final String value;
  final IconData? icon;
  final Color? color;

  const StatItem({
    required this.label,
    required this.value,
    this.icon,
    this.color,
  });
}
