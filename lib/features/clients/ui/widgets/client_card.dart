import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/displays/status_chip.dart';
import 'package:jawlati/core/models/payment_method.dart';

import '../../data/models/client_model.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String? lastOrderDate;
  final List<AppPaymentMethod>? availablePaymentMethods;

  const ClientCard({
    super.key,
    required this.client,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.lastOrderDate,
    this.availablePaymentMethods,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              12.spacingVertical,
              _buildClientInfo(),
              12.spacingVertical,
              _buildContactAndLocation(),
              if (lastOrderDate != null) ...[
                8.spacingVertical,
                _buildLastOrderInfo(),
              ],
              if (availablePaymentMethods?.isNotEmpty == true) ...[
                8.spacingVertical,
                _buildPaymentMethods(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mainBlue.colorWithOpacity(0.1),
          radius: 24,
          child: Icon(
            client.type == ClientType.company ? Icons.business : Icons.person,
            color: AppColors.mainBlue,
            size: 24,
          ),
        ),
        12.spacingHorizontal,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                client.name,
                style: AppTextStyles.body16DarkBlueSemiBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              4.spacingVertical,
              StatusChip(
                text: client.type == ClientType.company ? 'شركة' : 'فرد',
                backgroundColor: client.type == ClientType.company
                    ? Colors.blue.shade100
                    : Colors.green.shade100,
                textColor: client.type == ClientType.company
                    ? Colors.blue.shade700
                    : Colors.green.shade700,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildClientInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoItem(
              icon: Icons.account_balance_wallet,
              label: 'الرصيد',
              value: client.balance == 0
                  ? 'لا يوجد رصيد'
                  : '${client.balance.toStringAsFixed(2)} ش.ج',
              valueColor: client.balance > 0
                  ? Colors.green.shade700
                  : client.balance < 0
                  ? Colors.red.shade700
                  : Colors.grey.shade600,
            ),
          ),
          Container(width: 1, height: 30, color: Colors.grey.shade300),
          Expanded(
            child: _buildInfoItem(
              icon: Icons.shopping_bag,
              label: 'نوع الطلب',
              value: _getOrderTypeText(client.selectedOrderType),
              valueColor: Colors.blue.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactAndLocation() {
    return Column(
      children: [
        _buildInfoRow(
          icon: Icons.phone,
          label: 'رقم الهاتف',
          value: client.phone,
        ),
        if (client.address != null) ...[
          8.spacingVertical,
          _buildInfoRow(
            icon: Icons.location_on,
            label: 'العنوان',
            value: client.address!,
          ),
        ],
      ],
    );
  }

  Widget _buildLastOrderInfo() {
    return _buildInfoRow(
      icon: Icons.access_time,
      label: 'آخر طلب',
      value: lastOrderDate ?? 'لا يوجد طلبات سابقة',
      valueColor: lastOrderDate != null
          ? Colors.blue.shade700
          : Colors.grey.shade600,
    );
  }

  Widget _buildPaymentMethods() {
    if (availablePaymentMethods == null || availablePaymentMethods!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.payment, size: 16, color: Colors.grey.shade600),
            8.spacingHorizontal,
            Text(
              'طرق الدفع المتاحة:',
              style: AppTextStyles.caption12GrayMedium,
            ),
          ],
        ),
        8.spacingVertical,
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: availablePaymentMethods!
              .take(4)
              .map(
                (method) => Chip(
                  label: Text(
                    method.displayName,
                    style: AppTextStyles.caption13DartBlueMedium,
                  ),
                  backgroundColor: Colors.blue.shade50,
                  side: BorderSide(color: Colors.blue.shade200),
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        4.spacingVertical,
        Text(
          label,
          style: AppTextStyles.caption12GrayMedium.copyWith(fontSize: 10.sp),
          textAlign: TextAlign.center,
        ),
        2.spacingVertical,
        Text(
          value,
          style: AppTextStyles.caption13DartBlueMedium.copyWith(
            color: valueColor,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        8.spacingHorizontal,
        Text('$label: ', style: AppTextStyles.caption12GrayMedium),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.caption13DartBlueMedium.copyWith(
              color: valueColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _getOrderTypeText(OrderType type) {
    switch (type) {
      case OrderType.retail:
        return 'مفرق';
      case OrderType.wholesale:
        return 'جملة';
      case OrderType.mall:
        return 'مول';
    }
  }

  // ignore: unused_element
  Widget _buildActionMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit?.call();
            break;
          case 'delete':
            onDelete?.call();
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'edit',
          child: Row(
            children: [
              Icon(Icons.edit, size: 20),
              SizedBox(width: 8),
              Text('تحرير'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete, size: 20, color: Colors.red),
              SizedBox(width: 8),
              Text('حذف', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }
}
