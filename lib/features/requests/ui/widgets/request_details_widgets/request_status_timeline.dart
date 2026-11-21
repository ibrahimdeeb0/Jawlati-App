import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/request_enums.dart';
import '../../../data/models/load_request/load_request.dart';
import '../../../data/models/sales_request/sales_request.dart';

class RequestStatusTimeline extends StatelessWidget {
  final dynamic request;

  const RequestStatusTimeline({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final status = _getRequestStatus();
    
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
            Text(
              'حالة الطلب',
              style: AppTextStyles.body18DarkBlueBold,
            ),
            16.spacingVertical,
            _buildTimeline(status),
            if (status == RequestStatus.rejected && _hasRejectionReason()) ...[
              16.spacingVertical,
              _buildRejectionReason(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(RequestStatus currentStatus) {
    final steps = [
      _TimelineStep(
        status: RequestStatus.pending,
        title: 'تم إنشاء الطلب',
        description: 'في انتظار المراجعة',
        icon: Icons.assignment_outlined,
      ),
      _TimelineStep(
        status: RequestStatus.approved,
        title: 'تمت الموافقة',
        description: 'تم قبول الطلب',
        icon: Icons.check_circle_outline,
      ),
      _TimelineStep(
        status: RequestStatus.delivered,
        title: 'تم التسليم',
        description: 'تم إنجاز الطلب',
        icon: Icons.local_shipping_outlined,
      ),
    ];

    return Column(
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        final isActive = _isStepActive(step.status, currentStatus);
        final isCompleted = _isStepCompleted(step.status, currentStatus);
        final showLine = index < steps.length - 1;

        return _buildTimelineItem(
          step: step,
          isActive: isActive,
          isCompleted: isCompleted,
          showLine: showLine,
        );
      }).toList(),
    );
  }

  Widget _buildTimelineItem({
    required _TimelineStep step,
    required bool isActive,
    required bool isCompleted,
    required bool showLine,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildTimelineIcon(step.icon, isActive, isCompleted),
            if (showLine) _buildTimelineLine(isCompleted),
          ],
        ),
        16.spacingHorizontal,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: isActive || isCompleted
                    ? AppTextStyles.body16DarkBlueSemiBold
                    : AppTextStyles.body16GrayMedium,
              ),
              4.spacingVertical,
              Text(
                step.description,
                style: AppTextStyles.caption12GrayMedium,
              ),
              if (isActive) ...[
                4.spacingVertical,
                Text(
                  _getStatusDate(step.status),
                  style: AppTextStyles.caption12GrayMedium.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ],
              12.spacingVertical,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineIcon(IconData icon, bool isActive, bool isCompleted) {
    Color backgroundColor;
    Color iconColor;

    if (isCompleted) {
      backgroundColor = AppColors.green;
      iconColor = Colors.white;
    } else if (isActive) {
      backgroundColor = AppColors.mainBlue;
      iconColor = Colors.white;
    } else {
      backgroundColor = AppColors.gray.colorWithOpacity(0.2);
      iconColor = AppColors.gray;
    }

    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isCompleted ? Icons.check : icon,
        size: 20.r,
        color: iconColor,
      ),
    );
  }

  Widget _buildTimelineLine(bool isCompleted) {
    return Container(
      width: 2.w,
      height: 30.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      color: isCompleted ? AppColors.green : AppColors.gray.colorWithOpacity(0.3),
    );
  }

  Widget _buildRejectionReason() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.red.colorWithOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.red.colorWithOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 18.r,
                color: AppColors.red,
              ),
              8.spacingHorizontal,
              Text(
                'سبب الرفض',
                style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                  color: AppColors.red,
                ),
              ),
            ],
          ),
          8.spacingVertical,
          Text(
            _getRejectionReason(),
            style: AppTextStyles.body14GrayRegular,
          ),
        ],
      ),
    );
  }

  // Helper methods
  RequestStatus _getRequestStatus() {
    if (request is LoadRequest) {
      return (request as LoadRequest).status;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).status;
    }
    return RequestStatus.pending;
  }

  bool _isStepActive(RequestStatus stepStatus, RequestStatus currentStatus) {
    if (currentStatus == RequestStatus.rejected) {
      return stepStatus == RequestStatus.pending;
    }
    return stepStatus == currentStatus;
  }

  bool _isStepCompleted(RequestStatus stepStatus, RequestStatus currentStatus) {
    final statusOrder = {
      RequestStatus.pending: 1,
      RequestStatus.approved: 2,
      RequestStatus.delivered: 3,
    };

    final stepOrder = statusOrder[stepStatus] ?? 0;
    final currentOrder = statusOrder[currentStatus] ?? 0;

    return stepOrder < currentOrder;
  }

  bool _hasRejectionReason() {
    if (request is LoadRequest) {
      return (request as LoadRequest).rejectionReason?.isNotEmpty ?? false;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).rejectionReason?.isNotEmpty ?? false;
    }
    return false;
  }

  String _getRejectionReason() {
    if (request is LoadRequest) {
      return (request as LoadRequest).rejectionReason ?? '';
    } else if (request is SalesRequest) {
      return (request as SalesRequest).rejectionReason ?? '';
    }
    return '';
  }

  String _getStatusDate(RequestStatus status) {
    DateTime? date;
    
    if (status == RequestStatus.pending) {
      if (request is LoadRequest) {
        date = (request as LoadRequest).createdAt;
      } else if (request is SalesRequest) {
        date = (request as SalesRequest).createdAt;
      }
    } else if (status == RequestStatus.approved) {
      if (request is LoadRequest) {
        date = (request as LoadRequest).approvedAt;
      } else if (request is SalesRequest) {
        date = (request as SalesRequest).approvedAt;
      }
    }

    if (date != null) {
      return '${date.day}/${date.month}/${date.year}';
    }
    
    return '';
  }
}

class _TimelineStep {
  final RequestStatus status;
  final String title;
  final String description;
  final IconData icon;

  _TimelineStep({
    required this.status,
    required this.title,
    required this.description,
    required this.icon,
  });
}