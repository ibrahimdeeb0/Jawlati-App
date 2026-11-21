import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';

import '../../models/payment_method.dart';

class PaymentMethodSelector extends StatelessWidget {
  final List<AppPaymentMethod> availableMethods;

  final AppPaymentMethod? selectedMethod;

  final ValueChanged<AppPaymentMethod> onMethodSelected;

  const PaymentMethodSelector({
    super.key,
    required this.availableMethods,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: availableMethods.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final method = availableMethods[index];
        final isSelected = method == selectedMethod;

        return _PaymentMethodTile(
          method: method,
          isSelected: isSelected,
          onTap: () => onMethodSelected(method),
        );
      },
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final AppPaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodTile({
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? color.colorWithOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2.0 : 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(method.icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              method.displayName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : Colors.black87,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
