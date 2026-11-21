import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/request_item/request_item.dart';
import '../../../data/models/load_request/load_request.dart';
import '../../../data/models/sales_request/sales_request.dart';

class RequestItemsSection extends StatelessWidget {
  final dynamic request;

  const RequestItemsSection({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final items = _getRequestItems();

    // Debug information
    AppLogger().info('🔍 RequestItemsSection - Total items: ${items.length}\n'
        '🔍 Request type: ${request.runtimeType}');

    if (items.isEmpty) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 24.r,
                    color: AppColors.gray,
                  ),
                  12.spacingHorizontal,
                  Text(
                    'الأصناف المطلوبة',
                    style: AppTextStyles.body18DarkBlueBold,
                  ),
                ],
              ),
              16.spacingVertical,
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.gray.colorWithOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.gray,
                      size: 20.r,
                    ),
                    12.spacingHorizontal,
                    Text(
                      'لا توجد أصناف في هذا الطلب',
                      style: AppTextStyles.body16GrayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 24.r,
                  color: AppColors.mainBlue,
                ),
                12.spacingHorizontal,
                Text(
                  'الأصناف المطلوبة',
                  style: AppTextStyles.body18DarkBlueBold,
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue.colorWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '${items.length} صنف',
                    style: AppTextStyles.caption12GrayMedium.copyWith(
                      color: AppColors.mainBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            16.spacingVertical,
            _buildItemsTable(items),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsTable(List<RequestItem> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray.colorWithOpacity(0.2)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == items.length - 1;
            return _buildTableRow(item, isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    final isLoadRequest = request is LoadRequest;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'الصنف',
              style: AppTextStyles.body14DarkBlueSemiBold,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'الكمية',
              style: AppTextStyles.body14DarkBlueSemiBold,
              textAlign: TextAlign.center,
            ),
          ),
          if (!isLoadRequest) ...[
            Expanded(
              flex: 2,
              child: Text(
                'السعر',
                style: AppTextStyles.body14DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'المجموع',
                style: AppTextStyles.body14DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTableRow(RequestItem item, bool isLast) {
    final isLoadRequest = request is LoadRequest;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: !isLast
            ? Border(
                bottom: BorderSide(
                  color: AppColors.gray.colorWithOpacity(0.2),
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.body16DarkBlueSemiBold,
                ),
                4.spacingVertical,
                Text(
                  'الرمز: ${item.barcode}',
                  style: AppTextStyles.caption12GrayMedium,
                ),
                if (item.description?.isNotEmpty ?? false) ...[
                  2.spacingVertical,
                  Text(
                    item.description!,
                    style: AppTextStyles.caption12GrayMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${item.quantity} ${item.unit}',
              style: AppTextStyles.body16DarkBlueSemiBold,
              textAlign: TextAlign.center,
            ),
          ),
          if (!isLoadRequest) ...[
            Expanded(
              flex: 1,
              child: Text(
                '${item.price.toStringAsFixed(2)} د.أ',
                style: AppTextStyles.body16GrayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '${item.total.toStringAsFixed(2)} د.أ',
                style: AppTextStyles.body16DarkBlueSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Helper methods
  List<RequestItem> _getRequestItems() {
    if (request is LoadRequest) {
      return (request as LoadRequest).items;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).items;
    }
    return [];
  }
}
