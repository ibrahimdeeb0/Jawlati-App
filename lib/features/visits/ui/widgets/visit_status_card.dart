import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import '../../logic/visits_cubit.dart';
import '../../data/models/client_visit_model.dart';
import '../check_in_screen.dart';

class VisitStatusCard extends StatelessWidget {
  const VisitStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitsCubit, VisitsState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildCard(
            context: context,
            title: 'حالة الزيارة',
            subtitle: 'لا توجد زيارة نشطة',
            icon: Icons.location_off,
            color: AppColors.gray,
            onTap: null,
          ),
          loading: () => _buildLoadingCard(),
          loaded: (currentVisit, stats, message) => currentVisit != null
              ? _buildActiveVisitCard(context, currentVisit)
              : _buildInactiveCard(context),
          error: (message) => _buildCard(
            context: context,
            title: 'خطأ',
            subtitle: message,
            icon: Icons.error,
            color: Colors.red,
            onTap: null,
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback? onTap,
    Widget? trailing,
  }) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 3,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.colorWithOpacity(0.1),
                    color.colorWithOpacity(0.05),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: color.colorWithOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(icon, size: 24, color: color),
                  ),

                  SizedBox(width: 16.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.body16DarkBlueSemiBold,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          subtitle,
                          style: AppTextStyles.caption12GrayMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  if (trailing != null) trailing,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingCard() {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainBlue.colorWithOpacity(0.1),
                  AppColors.mainBlue.colorWithOpacity(0.05),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue.colorWithOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.refresh,
                    size: 24,
                    color: AppColors.mainBlue,
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'جاري التحميل...',
                        style: AppTextStyles.body16DarkBlueSemiBold,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveVisitCard(BuildContext context, ClientVisit visit) {
    final duration = DateTime.now().difference(visit.checkInTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    String durationText;
    if (hours > 0) {
      durationText = '${hours}س ${minutes}د';
    } else {
      durationText = '${minutes}د';
    }

    return _buildCard(
      context: context,
      title: 'زيارة نشطة',
      subtitle: 'عند ${visit.clientName} • المدة: $durationText',
      icon: Icons.location_on,
      color: AppColors.mainOrange,
      onTap: () {
        // إظهار تفاصيل الزيارة أو إنهائها
        _showActiveVisitOptions(context, visit);
      },
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.mainOrange.colorWithOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          'نشطة',
          style: TextStyle(
            color: AppColors.mainOrange,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInactiveCard(BuildContext context) {
    return _buildCard(
      context: context,
      title: 'حالة الزيارة',
      subtitle: 'لا توجد زيارة نشطة • اضغط لبدء زيارة جديدة',
      icon: Icons.add_location,
      color: AppColors.mainBlue,
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const CheckInScreen()));
      },
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.mainBlue,
        size: 16,
      ),
    );
  }

  void _showActiveVisitOptions(BuildContext context, ClientVisit visit) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _ActiveVisitBottomSheet(visit: visit),
    );
  }
}

class _ActiveVisitBottomSheet extends StatelessWidget {
  final ClientVisit visit;

  const _ActiveVisitBottomSheet({required this.visit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.mainOrange,
                    size: 24,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'الزيارة النشطة',
                    style: AppTextStyles.body16DarkBlueSemiBold,
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Visit Info
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.mainOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'العميل:',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Text(
                          visit.clientName ?? '',
                          style: AppTextStyles.body14DarkBlueMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'وقت الدخول:',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Text(
                          _formatTime(visit.checkInTime),
                          style: AppTextStyles.body14DarkBlueMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المدة:',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Text(
                          visit.visitDurationFormatted,
                          style: AppTextStyles.body14DarkBlueMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _cancelVisit(context);
                      },
                      icon: Icon(Icons.cancel, size: 18),
                      label: Text('إلغاء'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _checkOut(context);
                      },
                      icon: Icon(Icons.logout, size: 18),
                      label: Text('إنهاء الزيارة'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainOrange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _checkOut(BuildContext context) {
    // يمكن إضافة dialog للملاحظات
    context.read<VisitsCubit>().checkOut();
  }

  void _cancelVisit(BuildContext context) {
    // إظهار dialog للتأكيد
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('إلغاء الزيارة'),
        content: Text('هل أنت متأكد من إلغاء الزيارة الحالية؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('لا'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<VisitsCubit>().cancelVisit();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('نعم، إلغاء'),
          ),
        ],
      ),
    );
  }
}
