import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../data/models/request_enums.dart';
import '../../data/models/load_request/load_request.dart';
import '../../data/models/sales_request/sales_request.dart';

class RequestCard extends StatelessWidget {
  final dynamic request;
  final VoidCallback? onTap;

  const RequestCard({
    super.key,
    required this.request,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              _buildHeader(),
              _buildContent(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isLoadRequest = request is LoadRequest;
    final RequestType type =
        isLoadRequest ? RequestType.load : RequestType.sales;

    return Row(
      children: [
        _buildTypeIcon(type),
        12.spacingHorizontal,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getRequestTitle(),
                style: AppTextStyles.body16DarkBlueSemiBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              4.spacingVertical,
              Text(
                _getRequestSubtitle(),
                style: AppTextStyles.caption12GrayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        _buildStatusChip(_getRequestStatus()),
      ],
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
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(
        icon,
        size: 20.r,
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
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        status.displayName,
        style: AppTextStyles.caption12GrayMedium.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildContent() {
    final isLoadRequest = request is LoadRequest;

    if (isLoadRequest) {
      return _buildLoadRequestContent();
    } else {
      return _buildSalesRequestContent();
    }
  }

  Widget _buildLoadRequestContent() {
    return InfoRow(
      icon: Icons.inventory_2_outlined,
      label: 'عدد الأصناف',
      value: _getTotalItems(),
    );
  }

  Widget _buildSalesRequestContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InfoRow(
          icon: Icons.person_outline,
          label: 'العميل',
          value: _getClientName(),
        ),
        Row(
          children: [
            Expanded(
              child: InfoColumn(
                icon: Icons.person_outline,
                label: 'عدد العناصر',
                value: _getTotalItems(),
              ),
            ),
            Expanded(
              child: InfoColumn(
                icon: Icons.attach_money_outlined,
                label: 'المبلغ',
                value: _getTotalAmount(),
              ),
            ),
          ],
        ),
        12.spacingVertical,
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 14.r,
          color: AppColors.gray,
        ),
        4.spacingHorizontal,
        Text(
          _getFormattedDate(),
          style: AppTextStyles.caption12GrayMedium,
        ),
        const Spacer(),
        Text(
          _getRequestNumber(),
          style: AppTextStyles.caption12GrayMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Helper methods
  String _getRequestTitle() {
    final isLoadRequest = request is LoadRequest;
    return isLoadRequest ? 'طلب تحميل' : 'طلب مبيعات';
  }

  String _getRequestSubtitle() {
    final isLoadRequest = request is LoadRequest;
    if (isLoadRequest) {
      return 'طلب بضاعة من المستودع';
    } else {
      return 'طلب مبيعات للعميل';
    }
  }

  RequestStatus _getRequestStatus() {
    if (request is LoadRequest) {
      return (request as LoadRequest).status;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).status;
    }
    return RequestStatus.pending;
  }

  String _getRequestNumber() {
    if (request is LoadRequest) {
      return (request as LoadRequest).requestNumber;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).requestNumber;
    }
    return 'REQ001';
  }

  String _getFormattedDate() {
    DateTime? date;
    if (request is LoadRequest) {
      date = (request as LoadRequest).date;
    } else if (request is SalesRequest) {
      date = (request as SalesRequest).date;
    }

    if (date != null) {
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        return 'اليوم';
      } else if (difference.inDays == 1) {
        return 'أمس';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} أيام';
      } else {
        return '${date.day}/${date.month}/${date.year}';
      }
    }

    return 'اليوم';
  }

  // bool _hasNotes() {
  //   if (request is LoadRequest) {
  //     return (request as LoadRequest).notes.isNotEmpty;
  //   } else if (request is SalesRequest) {
  //     return (request as SalesRequest).notes.isNotEmpty;
  //   }
  //   return false;
  // }

  String _getClientName() {
    if (request is SalesRequest) {
      return (request as SalesRequest).client.name;
    }
    return 'عميل تجريبي';
  }

  String _getTotalAmount() {
    if (request is SalesRequest) {
      final salesRequest = request as SalesRequest;
      return '${salesRequest.totalAmount.toStringAsFixed(2)} د.أ';
    }
    return '0.00 د.أ';
  }

  String _getTotalItems() {
    if (request is LoadRequest) {
      return (request as LoadRequest).items.length.toString();
    } else if (request is SalesRequest) {
      return (request as SalesRequest).items.length.toString();
    }
    return '0';
  }
}
