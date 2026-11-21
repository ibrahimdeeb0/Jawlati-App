import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class ActionButtonsRow extends StatelessWidget {
  final VoidCallback onPrint;
  final VoidCallback onShare;

  const ActionButtonsRow({
    super.key,
    required this.onPrint,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back Button
        Expanded(
          child: _buildActionButton(
            label: 'العودة',
            icon: Icons.arrow_back_outlined,
            color: AppColors.gray,
            onPressed: () => Navigator.pop(context),
          ),
        ),

        12.spacingHorizontal,

        // Share Button
        Expanded(
          child: _buildActionButton(
            label: 'مشاركة',
            icon: Icons.share_outlined,
            color: AppColors.mainOrange,
            onPressed: onShare,
          ),
        ),

        12.spacingHorizontal,

        // Print Button
        Expanded(
          child: _buildActionButton(
            label: 'طباعة',
            icon: Icons.print_outlined,
            color: AppColors.mainBlue,
            onPressed: onPrint,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: color.colorWithOpacity(0.1),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: color.colorWithOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(24.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 18.r,
              ),
              8.spacingHorizontal,
              Text(
                label,
                style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
