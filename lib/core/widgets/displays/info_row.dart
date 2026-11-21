import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final bool showDivider;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.trailing,
    this.showDivider = false,
    this.onTap,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16.r,
              color: iconColor ?? AppColors.gray,
            ),
            8.spacingHorizontal,
          ],
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: labelStyle ?? AppTextStyles.body14GrayRegular,
            ),
          ),
          8.spacingHorizontal,
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: valueStyle ?? AppTextStyles.body14DarkBlueSemiBold,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null) ...[
            8.spacingHorizontal,
            trailing!,
          ],
        ],
      ),
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: content,
      );
    }

    return Column(
      children: [
        content,
        if (showDivider)
          Divider(
            height: 1.h,
            color: AppColors.borderGray,
            indent: 16.w,
            endIndent: 16.w,
          ),
      ],
    );
  }
}
