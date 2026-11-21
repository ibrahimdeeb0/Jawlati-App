import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class EmptyReceiptsState extends StatelessWidget {
  const EmptyReceiptsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                size: 64.sp,
                color: AppColors.mainBlue,
              ),
            ),
            
            32.spacingVertical,
            
            Text(
              'لا توجد سندات قبض',
              style: AppTextStyles.heading20BlackBold,
              textAlign: TextAlign.center,
            ),
            
            16.spacingVertical,
            
            Text(
              'لم يتم إنشاء أي سندات قبض بعد.\nابدأ بإنشاء سند القبض الأول',
              style: AppTextStyles.body16GrayMedium,
              textAlign: TextAlign.center,
            ),
            
            32.spacingVertical,
            
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: () => _navigateToAddReceipt(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  size: 20.sp,
                ),
                label: Text(
                  'إنشاء سند قبض جديد',
                  style: AppTextStyles.button16WhiteMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddReceipt(BuildContext context) {
    Navigator.pushNamed(context, AppRouterConstants.addReceipt);
  }
}