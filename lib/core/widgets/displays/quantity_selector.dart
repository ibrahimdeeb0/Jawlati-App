import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class QuantityCounter extends StatefulWidget {
  final int initialQuantity;
  final int maxQuantity;
  final Function(int) onChanged;

  const QuantityCounter({
    super.key,
    required this.initialQuantity,
    required this.maxQuantity,
    required this.onChanged,
  });

  @override
  QuantityCounterState createState() => QuantityCounterState();
}

class QuantityCounterState extends State<QuantityCounter> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
      widget.onChanged(_quantity);
    }
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
      widget.onChanged(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove, size: 18.r),
            onPressed: _decrement,
            color: AppColors.red,
          ),
          Text(
            _quantity.toString(),
            style: AppTextStyles.body16DarkBlueSemiBold,
          ),
          IconButton(
            icon: Icon(Icons.add, size: 18.r),
            onPressed: _increment,
            color: AppColors.mainBlue,
          ),
        ],
      ),
    );
  }
}
