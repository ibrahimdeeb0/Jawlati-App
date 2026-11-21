import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ItemsDataTable extends StatelessWidget {
  final List<TableRow> rows;
  final List<String> headers;
  final EdgeInsets? padding;

  const ItemsDataTable({
    super.key,
    required this.rows,
    required this.headers,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: headers.map((header) {
                return Expanded(
                  child: Text(
                    header,
                    style: AppTextStyles.body14DarkBlueSemiBold,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
          ),

          8.spacingVertical,

          // Data Rows
          ...rows.map(
            (row) => Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundPrimary,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: row.children[0],
            ),
          ),
        ],
      ),
    );
  }
}
