import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

class ReturnSummaryCard extends StatefulWidget {
  final double subtotal;
  final double totalAmount;
  final double refundAmount;
  final String notes;
  final Function(double) onRefundChanged;
  final Function(String) onNotesChanged;

  const ReturnSummaryCard({
    super.key,
    required this.subtotal,
    required this.totalAmount,
    required this.refundAmount,
    required this.notes,
    required this.onRefundChanged,
    required this.onNotesChanged,
  });

  @override
  State<ReturnSummaryCard> createState() => _ReturnSummaryCardState();
}

class _ReturnSummaryCardState extends State<ReturnSummaryCard> {
  late TextEditingController _refundController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _refundController = TextEditingController(
      text: widget.refundAmount.toStringAsFixed(2),
    );
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(ReturnSummaryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.refundAmount != widget.refundAmount) {
      _refundController.text = widget.refundAmount.toStringAsFixed(2);
    }
  }

  @override
  void dispose() {
    _refundController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ملخص المرتجع', style: AppTextStyles.body16DarkBlueSemiBold),

            16.spacingVertical,

            // المجموع الفرعي
            _buildSummaryRow(
              'المجموع الفرعي:',
              '${widget.subtotal.toStringAsFixed(2)} د.أ',
            ),

            8.spacingVertical,

            // المجموع الإجمالي
            _buildSummaryRow(
              'المجموع الإجمالي:',
              '${widget.totalAmount.toStringAsFixed(2)} د.أ',
              isTotal: true,
            ),

            16.spacingVertical,

            // المبلغ المسترد
            Text('المبلغ المسترد', style: AppTextStyles.body14DarkBlueSemiBold),
            8.spacingVertical,
            TextFormField(
              controller: _refundController,
              keyboardType: TextInputType.number,
              style: AppTextStyles.body14DarkBlueRegular,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: 'المبلغ المسترد',
                labelStyle: AppTextStyles.body14GrayRegular,
                suffixText: 'د.أ',
                suffixStyle: AppTextStyles.caption12GrayMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.borderGray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.borderBlue),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                fillColor: AppColors.backgroundPrimary,
                filled: true,
              ),
              onChanged: (value) {
                final amount = double.tryParse(value) ?? 0.0;
                widget.onRefundChanged(amount);
              },
            ),

            16.spacingVertical,

            // الملاحظات
            Text('ملاحظات', style: AppTextStyles.body14DarkBlueSemiBold),
            4.spacingVertical,
            AppTextFormField(
              controller: _notesController,
              maxLines: 2,
              hintText: 'ملاحظات حول المرتجع',
              onChanged: widget.onNotesChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold.copyWith(
                  color: AppColors.errorRed,
                )
              : AppTextStyles.body14GrayRegular,
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold.copyWith(
                  color: AppColors.errorRed,
                )
              : AppTextStyles.body14DarkBlueSemiBold,
        ),
      ],
    );
  }
}
