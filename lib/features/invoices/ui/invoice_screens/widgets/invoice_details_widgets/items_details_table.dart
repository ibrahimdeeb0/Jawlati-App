import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice_item/invoice_item.dart';

class ItemsDetailsTable extends StatelessWidget {
  final List<InvoiceItem> items;

  const ItemsDetailsTable({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderGray.colorWithOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.mainBlue, AppColors.darkBlue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
            child: Text(
              'تفاصيل المواد',
              style: AppTextStyles.body18WhiteSemiBold,
              textAlign: TextAlign.center,
            ),
          ),

          // Table Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary.colorWithOpacity(0.3),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: _headerText('الوحدة')),
                Expanded(flex: 2, child: _headerText('اسم المادة')),
                Expanded(flex: 2, child: _headerText('الكمية')),
                Expanded(flex: 2, child: _headerText('السعر')),
                Expanded(flex: 2, child: _headerText('الإجمالي')),
              ],
            ),
          ),

          // Items List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: AppColors.borderGray.colorWithOpacity(0.3),
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildItemRow(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(InvoiceItem item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // Unit
          Expanded(
            flex: 2,
            child: Text(
              item.unit,
              style: AppTextStyles.body14DarkBlueRegular,
              textAlign: TextAlign.center,
            ),
          ),

          // Item Name with Barcode
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.body14DarkBlueRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Quantity
          Expanded(
            flex: 2,
            child: Text(
              item.quantity.toString(),
              style: AppTextStyles.body14DarkBlueRegular,
              textAlign: TextAlign.center,
            ),
          ),

          // Price
          Expanded(
            flex: 2,
            child: Text(
              item.price.toStringAsFixed(2),
              style: AppTextStyles.body14DarkBlueRegular,
              textAlign: TextAlign.center,
            ),
          ),

          // Total
          Expanded(
            flex: 2,
            child: Text(
              (item.price * item.quantity).toStringAsFixed(2),
              style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                color: AppColors.mainBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Text(
      text,
      style: AppTextStyles.body14DarkBlueSemiBold,
      textAlign: TextAlign.center,
    );
  }
}
