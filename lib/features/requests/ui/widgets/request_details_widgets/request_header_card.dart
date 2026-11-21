import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/helpers/extensions.dart';

import '../../../data/models/request_enums.dart';
import '../../../data/models/load_request/load_request.dart';
import '../../../data/models/sales_request/sales_request.dart';

class RequestHeaderCard extends StatelessWidget {
  final dynamic request;

  const RequestHeaderCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final isLoadRequest = request is LoadRequest;
    final RequestType type =
        isLoadRequest ? RequestType.load : RequestType.sales;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Row(
              children: [
                _buildTypeIcon(type),
                16.spacingHorizontal,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getRequestTitle(type),
                        style: AppTextStyles.heading20BlackBold,
                      ),
                      4.spacingVertical,
                      Text(
                        _getRequestNumber(),
                        style: AppTextStyles.body16GrayMedium,
                      ),
                    ],
                  ),
                ),
                _buildStatusChip(_getRequestStatus()),
              ],
            ),
            20.spacingVertical,
            _buildRequestInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeIcon(RequestType type) {
    final IconData icon;
    final Color backgroundColor;

    switch (type) {
      case RequestType.load:
        icon = Icons.local_shipping_outlined;
        backgroundColor = AppColors.mainBlue.colorWithOpacity(0.1);
        break;
      case RequestType.sales:
        icon = Icons.receipt_long_outlined;
        backgroundColor = AppColors.mainOrange.colorWithOpacity(0.1);
        break;
    }

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 28.r,
        color: type == RequestType.load
            ? AppColors.mainBlue
            : AppColors.mainOrange,
      ),
    );
  }

  Widget _buildStatusChip(RequestStatus status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case RequestStatus.pending:
        backgroundColor = AppColors.mainOrange.colorWithOpacity(0.1);
        textColor = AppColors.mainOrange;
        break;
      case RequestStatus.approved:
        backgroundColor = AppColors.green.colorWithOpacity(0.1);
        textColor = AppColors.green;
        break;
      case RequestStatus.rejected:
        backgroundColor = AppColors.red.colorWithOpacity(0.1);
        textColor = AppColors.red;
        break;
      case RequestStatus.delivered:
        backgroundColor = AppColors.mainBlue.colorWithOpacity(0.1);
        textColor = AppColors.mainBlue;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status.displayName,
        style: AppTextStyles.body14GrayRegular.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRequestInfo() {
    final isLoadRequest = request is LoadRequest;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'تاريخ الطلب',
            value: _getFormattedDate(),
          ),
          12.spacingVertical,
          if (isLoadRequest) ...[
            _buildInfoRow(
              icon: Icons.inventory_2_outlined,
              label: 'عدد الأصناف',
              value: _getTotalItems(),
            ),
          ] else ...[
            _buildInfoRow(
              icon: Icons.person_outline,
              label: 'العميل',
              value: _getClientName(),
            ),
            12.spacingVertical,
            _buildInfoRow(
              icon: Icons.inventory_outlined,
              label: 'الأصناف',
              value: _getTotalItems(),
            ),
            12.spacingVertical,
            _buildInfoRow(
              icon: Icons.attach_money_outlined,
              label: 'المبلغ الإجمالي',
              value: _getTotalAmount(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.r,
          color: AppColors.gray,
        ),
        8.spacingHorizontal,
        Text(
          label,
          style: AppTextStyles.body14GrayRegular,
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.body14DarkBlueSemiBold,
        ),
      ],
    );
  }

  // Helper methods
  String _getRequestTitle(RequestType type) {
    return type == RequestType.load ? 'طلب تحميل' : 'طلب مبيعات';
  }

  String _getRequestNumber() {
    if (request is LoadRequest) {
      return 'رقم الطلب: ${(request as LoadRequest).requestNumber}';
    } else if (request is SalesRequest) {
      return 'رقم الطلب: ${(request as SalesRequest).requestNumber}';
    }
    return 'رقم الطلب: REQ001';
  }

  RequestStatus _getRequestStatus() {
    if (request is LoadRequest) {
      return (request as LoadRequest).status;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).status;
    }
    return RequestStatus.pending;
  }

  String _getFormattedDate() {
    DateTime? date;
    if (request is LoadRequest) {
      date = (request as LoadRequest).date;
    } else if (request is SalesRequest) {
      date = (request as SalesRequest).date;
    }

    if (date != null) {
      return '${date.day}/${date.month}/${date.year}';
    }
    return 'غير محدد';
  }

  String _getTotalItems() {
    if (request is LoadRequest) {
      return (request as LoadRequest).items.length.toString();
    } else if (request is SalesRequest) {
      return (request as SalesRequest).items.length.toString();
    }
    return '0';
  }

  String _getClientName() {
    if (request is SalesRequest) {
      return (request as SalesRequest).client.name;
    }
    return 'غير محدد';
  }

  String _getTotalAmount() {
    if (request is SalesRequest) {
      final salesRequest = request as SalesRequest;
      return '${salesRequest.totalAmount.toStringAsFixed(2)} د.أ';
    }
    return '0.00 د.أ';
  }
}
