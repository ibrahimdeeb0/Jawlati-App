import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ActionMenuButton extends StatelessWidget {
  final List<ActionMenuItem> items;
  final IconData icon;
  final String? tooltip;

  const ActionMenuButton({
    super.key,
    required this.items,
    this.icon = Icons.more_vert,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        icon,
        color: AppColors.gray,
        size: 20.r,
      ),
      tooltip: tooltip ?? 'خيارات',
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      itemBuilder: (context) => items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return PopupMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 16.r,
                color: item.color ?? AppColors.darkBlue,
              ),
              8.horizontalSpace,
              Text(
                item.title,
                style: AppTextStyles.body14DarkBlueRegular.copyWith(
                  color: item.color ?? AppColors.darkBlue,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onSelected: (index) {
        if (index < items.length) {
          items[index].onTap();
        }
      },
    );
  }
}

class ActionMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const ActionMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });
}
