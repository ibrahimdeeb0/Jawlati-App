import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import 'receipt_card.dart';

class ReceiptsList extends StatelessWidget {
  final List<ReceiptVoucherModel> receipts;
  final Function(ReceiptVoucherModel) onReceiptPressed;
  final Function(ReceiptVoucherModel) onReceiptDeleted;

  const ReceiptsList({
    super.key,
    required this.receipts,
    required this.onReceiptPressed,
    required this.onReceiptDeleted,
  });

  @override
  Widget build(BuildContext context) {
    if (receipts.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64.r,
              color: AppColors.gray,
            ),
            16.spacingVertical,
            Text(
              'لا توجد سندات قبض',
              style: AppTextStyles.body16GrayMedium,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سندات القبض (${receipts.length})',
          style: AppTextStyles.body16DarkBlueSemiBold,
        ),
        16.spacingVertical,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: receipts.length,
          separatorBuilder: (context, index) => 12.spacingVertical,
          itemBuilder: (context, index) {
            final receipt = receipts[index];
            return ReceiptCard(
              receipt: receipt,
              onPressed: () => onReceiptPressed(receipt),
              onDeleted: () => onReceiptDeleted(receipt),
            );
          },
        ),
      ],
    );
  }
}
