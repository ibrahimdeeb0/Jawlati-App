import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';

class ClientInfoCard extends StatelessWidget {
  final InvoiceModel invoice;

  const ClientInfoCard({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.mainOrange.colorWithOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.mainOrange,
                  size: 20.r,
                ),
              ),
              12.spacingHorizontal,
              Text(
                'بيانات العميل',
                style: AppTextStyles.body16DarkBlueSemiBold,
              ),
            ],
          ),

          16.spacingVertical,

          // Client Name
          _buildInfoItem(
            'اسم العميل:',
            invoice.clientName,
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
