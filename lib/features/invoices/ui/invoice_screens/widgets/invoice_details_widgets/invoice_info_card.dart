import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';

class InvoiceInfoCard extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceInfoCard({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.colorWithOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.description_outlined,
                  color: AppColors.mainBlue,
                  size: 20.r,
                ),
              ),
              12.spacingHorizontal,
              Text(
                'بيانات الفاتورة',
                style: AppTextStyles.body16DarkBlueSemiBold,
              ),
            ],
          ),

          16.spacingVertical,

          // Invoice Info Grid
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'رقم الفاتورة:',
                  invoice.invoiceNumber ?? invoice.id.substring(0, 4),
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'تاريخ الفاتورة:',
                  DateTimeHelper.formatShortDate(invoice.createdAt),
                ),
              ),
            ],
          ),

          12.spacingVertical,

          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'اسم المندوب:',
                  'ibra@gmail.com', // يمكن إضافة هذا للـ model
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  'وقت الطباعة:',
                  DateTimeHelper.formatInvoiceDate(DateTime.now()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption12GrayMedium,
        ),
        4.spacingVertical,
        Text(
          value,
          style: AppTextStyles.body14DarkBlueRegular,
        ),
      ],
    );
  }
}
