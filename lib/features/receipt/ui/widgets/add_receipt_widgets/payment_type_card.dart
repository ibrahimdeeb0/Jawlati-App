import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';

import '../../../data/models/receipt_enums.dart';

class PaymentTypeCard extends StatelessWidget {
  final ReceiptType selectedType;
  final Function(ReceiptType) onTypeSelected;

  const PaymentTypeCard({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'نوع الدفع',
      child: Column(
        children: [
          _buildTypeOption(ReceiptType.cash),
          8.spacingVertical,
          _buildTypeOption(ReceiptType.cheque),
          8.spacingVertical,
          _buildTypeOption(ReceiptType.bankTransfer),
          8.spacingVertical,
          _buildTypeOption(ReceiptType.creditCard),
          8.spacingVertical,
          _buildTypeOption(ReceiptType.other),
        ],
      ),
    );
  }

  Widget _buildTypeOption(ReceiptType type) {
    final isSelected = selectedType == type;
    return GestureDetector(
      onTap: () => onTypeSelected(type),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainBlue.colorWithOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.mainBlue : AppColors.lightGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.mainBlue : AppColors.gray,
              size: 20.sp,
            ),
            12.horizontalSpace,
            Text(
              type.displayName,
              style: AppTextStyles.body14DarkBlueMedium.copyWith(
                color: isSelected ? AppColors.mainBlue : AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
