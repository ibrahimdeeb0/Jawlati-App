import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/forms/app_text_form_field.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import '../logic/visits_cubit.dart';
import 'widgets/client_selection_widget.dart';
import 'widgets/visit_issue_message.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  Client? _selectedClient;
  final _purposeController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _purposeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'بدء زيارة جديدة',
            style: AppTextStyles.body18DarkBlueBold,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: AppColors.darkBlue),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اختيار العميل
              _buildSectionHeader('اختر العميل'),
              SizedBox(height: 12.h),
              ClientSelectionWidget(
                selectedClient: _selectedClient,
                onClientSelected: (client) {
                  setState(() {
                    _selectedClient = client;
                  });
                },
              ),

              SizedBox(height: 24.h),

              // غرض الزيارة
              _buildSectionHeader('غرض الزيارة (اختياري)'),
              SizedBox(height: 12.h),
              _buildPurposeSelection(),

              SizedBox(height: 24.h),

              // ملاحظات
              _buildSectionHeader('ملاحظات إضافية (اختياري)'),
              SizedBox(height: 12.h),
              AppTextFormField(
                controller: _notesController,
                hintText: 'أضف ملاحظات حول الزيارة...',
                maxLines: 3,
              ),

              SizedBox(height: 32.h),

              // زر بدء الزيارة
              BlocBuilder<VisitsCubit, VisitsState>(
                builder: (context, state) {
                  final isLoading = state.isBusy;

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedClient == null || isLoading
                          ? null
                          : _startVisit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainOrange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              'بدء الزيارة',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: AppTextStyles.body16DarkBlueSemiBold);
  }

  Widget _buildPurposeSelection() {
    final purposes = [
      'زيارة روتينية',
      'متابعة طلب',
      'تحصيل مستحقات',
      'عرض منتجات جديدة',
      'حل مشكلة',
      'أخرى',
    ];

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: purposes.map((purpose) {
        final isSelected = _purposeController.text == purpose;
        return FilterChip(
          label: Text(purpose),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _purposeController.text = selected ? purpose : '';
            });
          },
          selectedColor: AppColors.mainBlue.colorWithOpacity(0.2),
          checkmarkColor: AppColors.mainBlue,
        );
      }).toList(),
    );
  }

  Future<void> _startVisit() async {
    final client = _selectedClient;
    if (client == null) return;

    final purpose = _purposeController.text.trim();
    final notes = _notesController.text.trim();
    final messenger = ScaffoldMessenger.of(context);
    final issue = await context.read<VisitsCubit>().checkIn(
      clientId: client.id,
      purpose: purpose.isEmpty ? null : purpose,
      notes: notes.isEmpty ? null : notes,
    );

    if (!mounted) return;
    if (issue != null) {
      showVisitIssue(context, issue);
      return;
    }
    Navigator.pop(context);
    messenger.showSnackBar(
      const SnackBar(content: Text('تم بدء الزيارة بنجاح')),
    );
  }
}
