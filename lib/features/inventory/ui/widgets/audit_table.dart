import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/helpers/spacing_extension.dart';
import '../../data/models/inventory_item.dart';

class AuditTable extends StatelessWidget {
  final List<InventoryItem> items;
  final Function(InventoryItem) onItemTap;

  const AuditTable({super.key, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(),

          // Items List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(8.r),
              itemCount: items.length,
              separatorBuilder: (context, index) => 8.spacingVertical,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildItemRow(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: _headerCell('اسم المادة')),
          Expanded(flex: 2, child: _headerCell('الوحدة')),
          Expanded(flex: 2, child: _headerCell('كمية النظام')),
          Expanded(flex: 2, child: _headerCell('الكمية الفعلية')),
          Expanded(flex: 2, child: _headerCell('الفرق')),
        ],
      ),
    );
  }

  Widget _headerCell(String title) {
    return Text(
      title,
      style: AppTextStyles.body14DarkBlueSemiBold,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildItemRow(InventoryItem item) {
    final difference = item.difference;
    final hasDifference = difference != 0;

    return GestureDetector(
      onTap: () => onItemTap(item),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: hasDifference ? AppColors.lightOrange : AppColors.borderGray,
            width: hasDifference ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_drop_down_circle_rounded,
              color: AppColors.mainBlue,
            ),
            Expanded(
              flex: 3,
              child: Text(
                item.name,
                style: AppTextStyles.body14DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.unit,
                style: AppTextStyles.body14DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.systemQuantity.toString(),
                style: AppTextStyles.body14DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                item.auditQuantity == 0 ? '-' : item.auditQuantity.toString(),
                style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                  color: item.auditQuantity > 0 ? Colors.green : null,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                difference == 0 ? '-' : difference.toString(),
                style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                  color: difference > 0
                      ? Colors.green
                      : difference < 0
                      ? Colors.red
                      : null,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
