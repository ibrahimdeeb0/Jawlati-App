import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../data/models/client_model.dart';
import '../../logic/view_clients_cubit/view_clients_cubit.dart';

class ClientFilterOptions extends StatelessWidget {
  final Function(ClientType?) onFilterByType;
  final Function(SortBy) onSortBy;

  const ClientFilterOptions({
    super.key,
    required this.onFilterByType,
    required this.onSortBy,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding:   EdgeInsets.all(20.0.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تصفية وترتيب العملاء',
              style: AppTextStyles.body18DarkBlueSemiBold,
            ),
            20.spacingVertical,
      
            // Filter by type section
            Text(
              'تصفية حسب النوع',
              style: AppTextStyles.body16DarkBlueSemiBold,
            ),
            12.spacingVertical,
            _buildFilterTypeOptions(),
      
            20.spacingVertical,
      
            // Sort section
            Text(
              'ترتيب حسب',
              style: AppTextStyles.body16DarkBlueSemiBold,
            ),
            12.spacingVertical,
            _buildSortOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTypeOptions() {
    return Column(
      children: [
        _buildFilterOption(
          title: 'جميع العملاء',
          onTap: () => onFilterByType(null),
        ),
        _buildFilterOption(
          title: 'الأفراد فقط',
          onTap: () => onFilterByType(ClientType.individual),
        ),
        _buildFilterOption(
          title: 'الشركات فقط',
          onTap: () => onFilterByType(ClientType.company),
        ),
      ],
    );
  }

  Widget _buildSortOptions() {
    return Column(
      children: [
        _buildFilterOption(
          title: 'الاسم (أ - ي)',
          onTap: () => onSortBy(SortBy.nameAsc),
        ),
        _buildFilterOption(
          title: 'الاسم (ي - أ)',
          onTap: () => onSortBy(SortBy.nameDesc),
        ),
        _buildFilterOption(
          title: 'تاريخ الإضافة (الأحدث)',
          onTap: () => onSortBy(SortBy.dateDesc),
        ),
        _buildFilterOption(
          title: 'تاريخ الإضافة (الأقدم)',
          onTap: () => onSortBy(SortBy.dateAsc),
        ),
      ],
    );
  }

  Widget _buildFilterOption({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.body14DarkBlueBold.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
