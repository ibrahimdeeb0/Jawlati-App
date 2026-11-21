import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';

class AmountInputCard extends StatefulWidget {
  final double amount;
  final Function(double) onAmountChanged;

  const AmountInputCard({
    super.key,
    required this.amount,
    required this.onAmountChanged,
  });

  @override
  State<AmountInputCard> createState() => _AmountInputCardState();
}

class _AmountInputCardState extends State<AmountInputCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.amount > 0) {
      _controller.text = widget.amount.toString();
    }
  }

  @override
  void didUpdateWidget(AmountInputCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.amount != oldWidget.amount) {
      _controller.text = widget.amount > 0 ? widget.amount.toString() : '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'المبلغ',
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.extraLightGray,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                onChanged: (value) {
                  final amount = double.tryParse(value) ?? 0.0;
                  widget.onAmountChanged(amount);
                },
                decoration: const InputDecoration(
                  hintText: '0.00',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: AppTextStyles.heading20BlackBold,
                textAlign: TextAlign.start,
              ),
            ),
            12.spacingHorizontal,
            Text(
              'د.أ',
              style: AppTextStyles.body16GrayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
