import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';

class SelectableListCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? subTitleIcon;
  final String? subtitle2;
  final IconData? subTitleIcon2;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? leadingIcon;
  final Color? primaryColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;

  const SelectableListCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
    this.subTitleIcon,
    this.subtitle2,
    this.subTitleIcon2,
    this.leadingIcon,
    this.primaryColor,
    this.margin,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final color = primaryColor ?? Theme.of(context).primaryColor;

    return Card(
      margin: margin ?? EdgeInsets.only(bottom: 12.h),
      elevation: isSelected ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: isSelected ? BorderSide(color: color, width: 2) : BorderSide.none,
      ),
      child: ListTile(
        contentPadding: contentPadding ?? EdgeInsets.all(12.r),
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: isSelected
                ? color.colorWithOpacity(0.2)
                : color.colorWithOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            leadingIcon ?? Icons.person_outline,
            color: color,
            size: 24.r,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? color : null,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: _buildSubtitle(color),
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.add_circle_outline,
          color: isSelected ? color : Colors.grey,
          size: 24.r,
        ),
      ),
    );
  }

  Widget? _buildSubtitle(Color color) {
    final hasSubtitle = subtitle?.isNotEmpty == true;
    final hasSubtitle2 = subtitle2?.isNotEmpty == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasSubtitle) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              if (subTitleIcon != null) ...[
                Icon(subTitleIcon, size: 16.r, color: color),
                SizedBox(width: 4.w),
              ],
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
        if (hasSubtitle2) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              if (subTitleIcon2 != null) ...[
                Icon(subTitleIcon2, size: 16.r, color: color),
                SizedBox(width: 4.w),
              ],
              Text(
                subtitle2!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
