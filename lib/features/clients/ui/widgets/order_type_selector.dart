import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import '../../data/models/client_model.dart';

class OrderTypeSelector extends StatelessWidget {
  final OrderType selectedOrderType;
  final Function(OrderType) onOrderTypeChanged;
  final List<OrderType> availableOrderTypes;

  const OrderTypeSelector({
    super.key,
    required this.selectedOrderType,
    required this.onOrderTypeChanged,
    required this.availableOrderTypes,
  });

  String _getOrderTypeName(OrderType orderType) {
    switch (orderType) {
      case OrderType.retail:
        return 'مفرق';
      case OrderType.wholesale:
        return 'جملة';
      case OrderType.mall:
        return 'مول';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نوع الطلب المحدد:',
            style: AppTextStyles.body14DarkBlueSemiBold,
          ),
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade300),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<OrderType>(
                value: selectedOrderType,
                onChanged: (OrderType? newValue) {
                  if (newValue != null) {
                    onOrderTypeChanged(newValue);
                  }
                },
                items: availableOrderTypes.map<DropdownMenuItem<OrderType>>((OrderType orderType) {
                  return DropdownMenuItem<OrderType>(
                    value: orderType,
                    child: Row(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: AppColors.mainBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        12.horizontalSpace,
                        Text(
                          _getOrderTypeName(orderType),
                          style: AppTextStyles.body14DarkBlueMedium,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                style: AppTextStyles.body14DarkBlueMedium,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.mainBlue,
                ),
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}