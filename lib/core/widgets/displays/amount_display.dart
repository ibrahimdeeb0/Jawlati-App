import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/spacing_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class AmountDisplay extends StatelessWidget {
  final String label;
  final double amount;
  final String currency;
  final Color? amountColor;
  final bool isTotal;
  final IconData? icon;

  const AmountDisplay({
    super.key,
    required this.label,
    required this.amount,
    this.currency = 'د.أ',
    this.amountColor,
    this.isTotal = false,
    this.icon,
  });

  factory AmountDisplay.total({
    required String label,
    required double amount,
    String currency = 'د.أ',
    IconData? icon,
  }) {
    return AmountDisplay(
      label: label,
      amount: amount,
      currency: currency,
      amountColor: AppColors.errorRed,
      isTotal: true,
      icon: icon,
    );
  }

  factory AmountDisplay.positive({
    required String label,
    required double amount,
    String currency = 'د.أ',
    IconData? icon,
  }) {
    return AmountDisplay(
      label: label,
      amount: amount,
      currency: currency,
      amountColor: AppColors.successGreen,
      icon: icon,
    );
  }

  factory AmountDisplay.negative({
    required String label,
    required double amount,
    String currency = 'د.أ',
    IconData? icon,
  }) {
    return AmountDisplay(
      label: label,
      amount: amount,
      currency: currency,
      amountColor: AppColors.errorRed,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isTotal ? AppColors.fillColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
        border: isTotal ? Border.all(color: AppColors.borderGray) : null,
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16.r,
              color: amountColor ?? AppColors.gray,
            ),
            8.spacingHorizontal,
          ],
          Expanded(
            child: Text(
              label,
              style: isTotal
                  ? AppTextStyles.body16DarkBlueSemiBold
                  : AppTextStyles.body14GrayRegular,
            ),
          ),
          Text(
            '${amount.toStringAsFixed(2)} $currency',
            style: isTotal
                ? AppTextStyles.body16DarkBlueSemiBold.copyWith(
                    color: amountColor ?? AppColors.errorRed,
                  )
                : AppTextStyles.body14DarkBlueSemiBold.copyWith(
                    color: amountColor ?? AppColors.darkBlue,
                  ),
          ),
        ],
      ),
    );
  }
}
