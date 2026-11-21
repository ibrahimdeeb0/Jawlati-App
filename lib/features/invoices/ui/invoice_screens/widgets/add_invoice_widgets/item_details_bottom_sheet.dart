import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/displays/quantity_dropdown.dart';

import '../../../../data/model/invoice_item/invoice_item.dart';

class ItemDetailsBottomSheet extends StatelessWidget {
  final InvoiceItem item;
  final int itemIndex;
  final void Function(int quantityOfBonus)? onBonusQuantityChanged;

  const ItemDetailsBottomSheet({
    super.key,
    required this.item,
    required this.itemIndex,
    this.onBonusQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.spacingVertical,

          // Item Name
          _buildDetailRow(
            label: 'اسم المادة',
            value: item.name,
            icon: Icons.inventory_2,
          ),
          12.spacingVertical,

          // Unit
          _buildDetailRow(
            label: 'الوحدة',
            value: item.unit,
            icon: Icons.straighten,
          ),
          12.spacingVertical,

          // Current Quantity
          _buildDetailRow(
            label: 'الكمية الحالية',
            value: item.quantity.toString(),
            icon: Icons.production_quantity_limits,
          ),
          12.spacingVertical,

          // Price
          _buildDetailRow(
            label: 'السعر',
            value: '${item.price.toStringAsFixed(2)} د.أ',
            icon: Icons.attach_money,
          ),
          12.spacingVertical,

          // Stock Quantity
          _buildDetailRow(
            label: 'الكمية المتاحة في المخزن',
            value: item.stockQuantity.toString(),
            icon: Icons.warehouse,
          ),
          16.spacingVertical,

          // Bonus Quantity Section
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary.colorWithOpacity(0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.borderGray.colorWithOpacity(0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: AppColors.mainBlue,
                      size: 20.r,
                    ),
                    8.spacingHorizontal,
                    Text(
                      'كمية البونص',
                      style: AppTextStyles.body16DarkBlueSemiBold,
                    ),
                  ],
                ),
                12.spacingVertical,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'الكمية الحالية للبونص: ${item.quantityOfBonus}',
                        style: AppTextStyles.body14DarkBlueRegular,
                      ),
                    ),
                    16.spacingHorizontal,
                    QuantityDropdown(
                      value: item.quantityOfBonus,
                      min: 0,
                      max: item.stockQuantity - item.quantity,
                      isDisabled: false,
                      onChanged: (newQty) {
                        onBonusQuantityChanged?.call(newQty);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.spacingVertical,

          // Total Section
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.mainBlue.colorWithOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الإجمالي', style: AppTextStyles.body16DarkBlueSemiBold),
                Text(
                  '${(item.price * item.quantity).toStringAsFixed(2)} د.أ',
                  style: AppTextStyles.body18DarkBlueSemiBold.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ],
            ),
          ),
          20.spacingVertical,
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.mainBlue, size: 18.r),
        8.spacingHorizontal,
        Expanded(child: Text(label, style: AppTextStyles.body14GrayRegular)),
        Text(value, style: AppTextStyles.body14DarkBlueSemiBold),
      ],
    );
  }
}
