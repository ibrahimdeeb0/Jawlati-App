import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? action;
  final Color? iconColor;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.action,
    this.iconColor,
  });

  factory EmptyStateWidget.noInvoices({
    Widget? action,
  }) {
    return EmptyStateWidget(
      icon: Icons.receipt_long_outlined,
      title: 'لا توجد فواتير مرتجع',
      subtitle: 'لم يتم إنشاء أي فواتير مرتجع بعد',
      action: action,
      iconColor: AppColors.gray,
    );
  }

  factory EmptyStateWidget.noSearchResults({
    required String searchQuery,
  }) {
    return EmptyStateWidget(
      icon: Icons.search_off,
      title: 'لا توجد نتائج',
      subtitle: 'لم يتم العثور على فواتير تطابق "$searchQuery"',
      iconColor: AppColors.gray,
    );
  }

  factory EmptyStateWidget.noFilterResults({
    required String filterName,
  }) {
    return EmptyStateWidget(
      icon: Icons.filter_alt_off,
      title: 'لا توجد فواتير',
      subtitle: 'لا توجد فواتير مرتجع في فئة "$filterName"',
      iconColor: AppColors.gray,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.r,
              color: iconColor ?? AppColors.gray,
            ),
            24.spacingVertical,
            Text(
              title,
              style: AppTextStyles.heading20BlackBold.copyWith(
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.center,
            ),
            8.spacingVertical,
            Text(
              subtitle,
              style: AppTextStyles.body14GrayRegular,
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[
              24.spacingVertical,
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
