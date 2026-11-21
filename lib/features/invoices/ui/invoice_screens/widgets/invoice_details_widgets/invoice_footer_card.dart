import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';

class InvoiceFooterCard extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceFooterCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderGray.colorWithOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Method Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('طريقة الدفع', style: AppTextStyles.body16DarkBlueSemiBold),
              //TODO Handle displayed method type
              // Row(
              //   children: [
              //     Icon(
              //       _getPaymentMethodIcon(),
              //       size: 18.r,
              //       color: AppColors.mainBlue,
              //     ),
              //     8.spacingHorizontal,
              //     Text(
              //       _getPaymentMethodText(),
              //       style: AppTextStyles.body14DarkBlueRegular,
              //     ),
              //   ],
              // ),
            ],
          ),

          16.spacingVertical,

          // Footer Note
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary.colorWithOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'البضاعة المباعة ليست برسم البيع وغير مكفولة ولا ترد ولا تستبدل',
              style: AppTextStyles.caption12GrayMedium,
              textAlign: TextAlign.center,
            ),
          ),

          16.spacingVertical,

          // Signature Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('التوقيع', style: AppTextStyles.body14DarkBlueRegular),
                  8.spacingVertical,
                  Container(
                    width: 100.w,
                    height: 1.h,
                    color: AppColors.borderGray,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'اسم المستلم',
                    style: AppTextStyles.body14DarkBlueRegular,
                  ),
                  8.spacingVertical,
                  Container(
                    width: 100.w,
                    height: 1.h,
                    color: AppColors.borderGray,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
