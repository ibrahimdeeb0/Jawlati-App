import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/buttons/gradient_button.dart';

class EmptyInvoicesState extends StatelessWidget {
  const EmptyInvoicesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty state illustration
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColors.mainBlue.colorWithOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long,
                size: 60.r,
                color: AppColors.mainBlue,
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              'لا توجد فواتير',
              style: AppTextStyles.heading20BlackBold.copyWith(
                color: AppColors.darkGray,
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              'لم يتم إنشاء أي فاتورة بعد.\nابدأ بإنشاء فاتورة جديدة الآن!',
              style: AppTextStyles.body16GrayMedium,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 32.h),

            GradientButton(
              onPressedSync: () => _navigateToAddInvoice(context),
              text: 'إنشاء فاتورة جديدة',
              icon: Icons.add,
              width: 200.w,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddInvoice(BuildContext context) {
    context.pushReplacementNamed(AppRouterConstants.addInvoice);
  }
}
