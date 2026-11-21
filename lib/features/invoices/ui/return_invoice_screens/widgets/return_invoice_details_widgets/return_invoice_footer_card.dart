import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/return_invoice_model/return_invoice_model.dart';

class ReturnInvoiceFooterCard extends StatelessWidget {
  final ReturnInvoiceModel invoice;

  const ReturnInvoiceFooterCard({
    super.key,
    required this.invoice,
  });

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
            // Footer Title
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Text(
                  'تفاصيل إضافية',
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Footer Content
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notes Section
                  if (invoice.notes.isNotEmpty) ...[
                    Text(
                      'ملاحظات المرتجع:',
                      style: AppTextStyles.body14DarkBlueSemiBold,
                    ),
                    8.spacingVertical,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.borderBlue),
                      ),
                      child: Text(
                        invoice.notes,
                        style: AppTextStyles.body14DarkBlueRegular.copyWith(
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ),
                    16.spacingVertical,
                  ],

                  // Creation and Update Information
                  _buildFooterInfoRow(
                    'تاريخ الإنشاء',
                    DateTimeHelper.formatInvoiceDate(invoice.createdAt),
                  ),

                  if (invoice.updatedAt != null) ...[
                    8.spacingVertical,
                    _buildFooterInfoRow(
                      'آخر تحديث',
                      DateTimeHelper.formatInvoiceDate(invoice.updatedAt!),
                    ),
                  ],

                  8.spacingVertical,
                  _buildFooterInfoRow(
                    'حالة المرتجع',
                    invoice.status.displayName,
                  ),

                  if (invoice.processedBy != null) ...[
                    8.spacingVertical,
                    _buildFooterInfoRow(
                      'تم المعالجة بواسطة',
                      invoice.processedBy!,
                    ),
                  ],

                  16.spacingVertical,

                  // Company Footer
                  Divider(color: AppColors.borderGray, thickness: 1),
                  8.spacingVertical,

                  Center(
                    child: Column(
                      children: [
                        Text(
                          'شكراً لتعاملكم معنا',
                          style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                            color: AppColors.mainBlue,
                          ),
                        ),
                        4.spacingVertical,
                        Text(
                          'شركة توزيع تجريبية',
                          style: AppTextStyles.body14GrayRegular,
                        ),
                        Text(
                          'demo@example.com',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body14GrayRegular,
        ),
        Text(
          value,
          style: AppTextStyles.body14DarkBlueSemiBold,
        ),
      ],
    );
  }
}
