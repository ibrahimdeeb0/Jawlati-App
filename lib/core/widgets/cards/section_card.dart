import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData? titleIcon;
  final Widget child;
  final List<Widget>? actions;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool showBorder;

  const SectionCard({
    super.key,
    required this.title,
    required this.child,
    this.titleIcon,
    this.actions,
    this.padding,
    this.backgroundColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: backgroundColor ?? AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: showBorder
            ? BorderSide(color: AppColors.borderGray, width: 0.5)
            : BorderSide.none,
      ),
      child: Container(
        padding: padding ??
            EdgeInsetsDirectional.symmetric(horizontal: 14.r, vertical: 12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Row(
              children: [
                if (titleIcon != null) ...[
                  Icon(
                    titleIcon,
                    color: AppColors.mainBlue,
                    size: 20.r,
                  ),
                  8.spacingHorizontal,
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body16DarkBlueSemiBold,
                  ),
                ),
                if (actions != null) ...actions!,
              ],
            ),

            child,
          ],
        ),
      ),
    );
  }
}
