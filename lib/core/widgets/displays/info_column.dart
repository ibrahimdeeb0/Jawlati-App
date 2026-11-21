import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final bool showDivider;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final bool expandValue;

  const InfoColumn({
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
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.spacing,
    this.padding,
    this.expandValue = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label Section
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16.r,
                  color: iconColor ?? AppColors.gray,
                ),
                8.spacingHorizontal,
              ],
              Flexible(
                child: Text(
                  label,
                  style: labelStyle ?? AppTextStyles.body14GrayRegular,
                ),
              ),
            ],
          ),

          // Spacing between label and value
          (spacing ?? 8.h).spacingVertical,

          // Value Section
          if (expandValue)
            Text(
              value,
              style: valueStyle ?? AppTextStyles.body14DarkBlueSemiBold,
              textAlign: crossAxisAlignment == CrossAxisAlignment.center
                  ? TextAlign.center
                  : crossAxisAlignment == CrossAxisAlignment.end
                      ? TextAlign.end
                      : TextAlign.start,
            )
          else
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: Text(
                  value,
                  style: valueStyle ?? AppTextStyles.body14DarkBlueSemiBold,
                  overflow: TextOverflow.ellipsis,
                  textAlign: crossAxisAlignment == CrossAxisAlignment.center
                      ? TextAlign.center
                      : crossAxisAlignment == CrossAxisAlignment.end
                          ? TextAlign.end
                          : TextAlign.start,
                ),
              ),
            ),

          // Trailing Widget if exists
          if (trailing != null) ...[
            (spacing ?? 8.h).spacingVertical,
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

    if (showDivider) {
      return Column(
        children: [
          content,
          Divider(
            height: 1.h,
            color: AppColors.borderGray,
            indent: 16.w,
            endIndent: 16.w,
          ),
        ],
      );
    }

    return content;
  }
}

// Companion widget for creating a grid of InfoColumns
class InfoColumnGrid extends StatelessWidget {
  final List<InfoColumnData> items;
  final int crossAxisCount;
  final double? spacing;
  final double? runSpacing;
  final EdgeInsetsGeometry? padding;

  const InfoColumnGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.spacing,
    this.runSpacing,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Wrap(
        spacing: spacing ?? 16.w,
        runSpacing: runSpacing ?? 16.h,
        children: items.map((item) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width -
                    (padding?.horizontal ?? 0) -
                    ((spacing ?? 16.w) * (crossAxisCount - 1))) /
                crossAxisCount,
            child: InfoColumn(
              label: item.label,
              value: item.value,
              icon: item.icon,
              iconColor: item.iconColor,
              trailing: item.trailing,
              showDivider: item.showDivider,
              onTap: item.onTap,
              labelStyle: item.labelStyle,
              valueStyle: item.valueStyle,
              crossAxisAlignment:
                  item.crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment:
                  item.mainAxisAlignment ?? MainAxisAlignment.start,
              spacing: item.spacing,
              padding: item.padding,
              expandValue: item.expandValue,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Data class for InfoColumnGrid
class InfoColumnData {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final bool showDivider;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final bool expandValue;

  const InfoColumnData({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.trailing,
    this.showDivider = false,
    this.onTap,
    this.labelStyle,
    this.valueStyle,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.spacing,
    this.padding,
    this.expandValue = false,
  });
}
