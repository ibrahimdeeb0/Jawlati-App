import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/requests/logic/requests_cubit/requests_cubit.dart';

class AddRequestFab extends StatelessWidget {
  final RequestsCubit cubit;
  const AddRequestFab({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddRequestOptions(context, cubit),
      backgroundColor: AppColors.mainOrange,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _showAddRequestOptions(BuildContext context, RequestsCubit cubit) {
    AppBottomSheet.showModal(
      context: context,
      title: 'إضافة طلب جديد',
      content: _AddRequestOptionsContent(cubit),
    );
  }
}

class _AddRequestOptionsContent extends StatelessWidget {
  final RequestsCubit cubit;

  const _AddRequestOptionsContent(this.cubit);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOptionTile(
              context,
              icon: Icons.local_shipping_outlined,
              title: 'طلب تحميل جديد',
              subtitle: 'اطلب بضاعة من المستودع الرئيسي',
              color: AppColors.mainBlue,
              onTap: () {
                Navigator.pop(context);
                _navigateToLoadRequest(context: context, cubit: cubit);
              },
            ),
            SizedBox(height: 16.h),
            _buildOptionTile(
              context,
              icon: Icons.receipt_long_outlined,
              title: 'طلب مبيعات جديد',
              subtitle: 'سجل طلب شراء لعميل',
              color: AppColors.mainOrange,
              onTap: () {
                Navigator.pop(context);
                _navigateToSalesRequest(context: context, cubit: cubit);
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderGray),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: color.colorWithOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                size: 24.r,
                color: color,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body16DarkBlueSemiBold,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.caption12GrayMedium,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLoadRequest({
    required BuildContext context,
    required RequestsCubit cubit,
  }) async {
    final route = await context.pushNamed(AppRouterConstants.addLoadRequest);

    if (route == true) {
      cubit.refreshData();
    }
  }

  void _navigateToSalesRequest({
    required BuildContext context,
    required RequestsCubit cubit,
  }) async {
    final route = await context.pushNamed(AppRouterConstants.addSalesRequest);

    if (route == true) {
      cubit.refreshData();
    }
  }
}
