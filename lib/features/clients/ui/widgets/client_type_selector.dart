import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../data/models/client_model.dart';

class ClientTypeSelector extends StatelessWidget {
  final ClientType selectedType;
  final ValueChanged<ClientType> onTypeChanged;

  const ClientTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع العميل',
          style: AppTextStyles.body14DarkBlueBold,
        ),
        8.spacingVertical,
        Row(
          children: [
            Expanded(
              child: _buildTypeOption(
                context,
                type: ClientType.individual,
                title: 'فرد',
                icon: Icons.person,
              ),
            ),
            12.spacingHorizontal,
            Expanded(
              child: _buildTypeOption(
                context,
                type: ClientType.company,
                title: 'شركة',
                icon: Icons.business,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeOption(
    BuildContext context, {
    required ClientType type,
    required String title,
    required IconData icon,
  }) {
    final isSelected = selectedType == type;

    AppLogger().info('selectedType: $selectedType, type: $type');

    return GestureDetector(
      onTap: () => onTypeChanged(type),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainBlue : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.darkBlue,
              size: 20,
            ),
            8.spacingHorizontal,
            Text(
              title,
              style: isSelected
                  ? AppTextStyles.body14WhiteMedium
                  : AppTextStyles.body14DarkBlueMedium,
            ),
          ],
        ),
      ),
    );
  }
}
