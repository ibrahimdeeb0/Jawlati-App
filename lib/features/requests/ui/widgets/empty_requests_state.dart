import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

class EmptyRequestsState extends StatelessWidget {
  final String? searchQuery;
  final VoidCallback? onRefresh;

  const EmptyRequestsState({
    super.key,
    this.searchQuery,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getEmptyIcon(),
              size: 80.r,
              color: AppColors.gray,
            ),
            24.spacingVertical,
            Text(
              _getEmptyTitle(),
              style: AppTextStyles.heading20BlackBold,
              textAlign: TextAlign.center,
            ),
            8.spacingVertical,
            Text(
              _getEmptyMessage(),
              style: AppTextStyles.body16GrayMedium,
              textAlign: TextAlign.center,
            ),
            if (onRefresh != null) ...[
              32.spacingVertical,
              AppOutlinedButton(
                onPressed: onRefresh!,
                text: 'تحديث',
                icon: Icons.refresh,
                width: 120.w,
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getEmptyIcon() {
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      return Icons.search_off_outlined;
    }
    return Icons.assignment_outlined;
  }

  String _getEmptyTitle() {
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      return 'لا توجد نتائج';
    }
    return 'لا توجد طلبات';
  }

  String _getEmptyMessage() {
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      return 'لم يتم العثور على طلبات تطابق "$searchQuery"';
    }
    return 'لم تقم بإنشاء أي طلبات بعد.\nاضغط على زر + لإنشاء طلب جديد';
  }
}
