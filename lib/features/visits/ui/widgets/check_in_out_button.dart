import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/widgets/index.dart';
import '../../logic/visits_cubit.dart';
import '../../data/models/client_visit_model.dart';
import '../check_in_screen.dart';

class CheckInOutButton extends StatelessWidget {
  const CheckInOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitsCubit, VisitsState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildButton(
            context: context,
            icon: Icons.location_on_outlined,
            isActive: false,
            onPressed: null,
          ),
          loading: () => _buildLoadingButton(),
          loaded: (currentVisit, stats, message) => _buildButton(
            context: context,
            icon: currentVisit != null ? Icons.logout : Icons.location_on,
            isActive: currentVisit != null,
            onPressed: () => _onButtonPressed(context, currentVisit),
            currentVisit: currentVisit,
          ),
          error: (message) => _buildButton(
            context: context,
            icon: Icons.location_off,
            isActive: false,
            onPressed: null,
            isError: true,
          ),
        );
      },
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required bool isActive,
    required VoidCallback? onPressed,
    ClientVisit? currentVisit,
    bool isError = false,
  }) {
    final color = isError
        ? Colors.red
        : isActive
        ? AppColors.mainOrange
        : Colors.white;

    return Stack(
      children: [
        IconButton.outlined(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: 20.r),
          style: IconButton.styleFrom(
            side: BorderSide(
              color: isActive ? AppColors.mainOrange : AppColors.borderGray,
              width: isActive ? 2 : 1,
            ),
            backgroundColor: isActive
                ? AppColors.mainOrange.colorWithOpacity(0.1)
                : null,
          ),
        ),
        if (isActive)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.mainOrange,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLoadingButton() {
    return IconButton.outlined(
      onPressed: null,
      icon: SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(AppColors.mainBlue),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context, ClientVisit? currentVisit) {
    if (currentVisit == null) {
      // بدء زيارة جديدة
      _showCheckInDialog(context);
    } else {
      // إنهاء الزيارة الحالية
      _showCheckOutDialog(context, currentVisit);
    }
  }

  void _showCheckInDialog(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const CheckInScreen()));
  }

  void _showCheckOutDialog(BuildContext context, ClientVisit currentVisit) {
    AppBottomSheet.showModal(
      context: context,
      title: 'إنهاء زيارة ${currentVisit.clientName}',
      content: _CheckOutContent(currentVisit: currentVisit),
    );
  }
}

class _CheckOutContent extends StatefulWidget {
  final ClientVisit currentVisit;

  const _CheckOutContent({required this.currentVisit});

  @override
  State<_CheckOutContent> createState() => _CheckOutContentState();
}

class _CheckOutContentState extends State<_CheckOutContent> {
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات الزيارة
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.mainBlue.colorWithOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.mainBlue, size: 20),
                  SizedBox(width: 8.w),
                  Text(
                    'مدة الزيارة: ${_formatDuration()}',
                    style: TextStyle(
                      color: AppColors.mainBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // ملاحظات إضافية
            Text(
              'ملاحظات إضافية (اختيارية)',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),

            SizedBox(height: 8.h),

            TextField(
              controller: _notesController,
              maxLines: 3,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'أضف ملاحظات حول الزيارة...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.all(12.r),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            SizedBox(height: 24.h),

            // أزرار التحكم
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('إلغاء'),
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: ElevatedButton(
                    onPressed: _checkOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainOrange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('إنهاء الزيارة'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration() {
    final duration = DateTime.now().difference(widget.currentVisit.checkInTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}س ${minutes}د';
    } else {
      return '${minutes}د';
    }
  }

  void _checkOut() {
    context.read<VisitsCubit>().checkOut(notes: _notesController.text.trim());
    Navigator.pop(context);
  }
}
