import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class QuantityDropdown extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool? isDisabled;

  const QuantityDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 100,
    this.width,
    this.height,
    this.contentPadding,
    this.backgroundColor,
    this.borderRadius,
    this.isDisabled,
  }) : assert(max >= min, 'max must be >= min');

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final bool _isDisabled = isDisabled ?? (min == 0);

    final List<int> quantities = _isDisabled
        ? []
        : List.generate(max - min + 1, (i) => min + i);

    final int safeValue = (!_isDisabled && value >= min && value <= max)
        ? value
        : min;

    return Container(
      width: (width ?? 80.w),
      height: (height ?? 35.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        color: backgroundColor ?? AppColors.backgroundPrimary,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: _isDisabled ? 0 : safeValue,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16.r,
            color: _isDisabled ? AppColors.borderGray : AppColors.mainBlue,
          ),
          style: AppTextStyles.body14DarkBlueRegular,
          dropdownColor: backgroundColor ?? AppColors.backgroundPrimary,
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 8.w),
          items: _isDisabled
              ? [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "0",
                        style: AppTextStyles.body14DarkBlueRegular.copyWith(
                          color: AppColors.borderGray,
                        ),
                      ),
                    ),
                  ),
                ]
              : quantities.map((q) {
                  return DropdownMenuItem<int>(
                    value: q,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        q.toString(),
                        style: AppTextStyles.body14DarkBlueRegular,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
          onChanged: _isDisabled
              ? null
              : (int? newValue) {
                  if (newValue != null && newValue != value) {
                    onChanged(newValue);
                  }
                },
        ),
      ),
    );
  }
}
