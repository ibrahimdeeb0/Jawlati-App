import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/load_request/load_request.dart';
import '../../../data/models/sales_request/sales_request.dart';

class RequestNotesSection extends StatelessWidget {
  final dynamic request;

  const RequestNotesSection({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final notes = _getNotes();

    if (notes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.note_outlined,
                  size: 24.r,
                  color: AppColors.mainOrange,
                ),
                12.spacingHorizontal,
                Text(
                  'ملاحظات إضافية',
                  style: AppTextStyles.heading20BlackBold,
                ),
              ],
            ),
            16.spacingVertical,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.gray.colorWithOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                notes,
                style: AppTextStyles.body16GrayMedium,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  String _getNotes() {
    if (request is LoadRequest) {
      return (request as LoadRequest).notes;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).notes;
    }
    return '';
  }
}