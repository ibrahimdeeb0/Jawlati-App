import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/buttons/gradient_button.dart';
import '../../../../core/widgets/forms/app_text_form_field.dart';
import '../../data/models/inventory_item.dart';

class QuantityInputSheet extends StatefulWidget {
  final InventoryItem item;
  final Function(double) onQuantityChanged;

  const QuantityInputSheet({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  State<QuantityInputSheet> createState() => _QuantityInputSheetState();
}

class _QuantityInputSheetState extends State<QuantityInputSheet> {
  final TextEditingController _quantityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _quantityController.text = widget.item.auditQuantity == 0
        ? ''
        : widget.item.auditQuantity.toString();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _saveQuantity() {
    if (_formKey.currentState!.validate()) {
      final quantity = double.tryParse(_quantityController.text) ?? 0.0;
      widget.onQuantityChanged(quantity);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundPrimary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: 50.w,
                height: 4.h,
                margin: EdgeInsets.only(top: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.borderGray,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(24.r),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'إدخال كمية الجرد',
                        style: AppTextStyles.body18DarkBlueSemiBold,
                      ),

                      SizedBox(height: 16.h),

                      // Item Info
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.fillColor,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.borderGray),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المادة: ${widget.item.name}',
                              style: AppTextStyles.body16DarkBlueSemiBold,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'الوحدة: ${widget.item.unit}',
                              style: AppTextStyles.body16DarkBlueSemiBold,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'الكمية في النظام: ${widget.item.systemQuantity}',
                              style: AppTextStyles.body16DarkBlueSemiBold,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Quantity Input
                      AppTextFormField(
                        controller: _quantityController,
                        labelText: 'الكمية الفعلية',
                        hintText: 'أدخل الكمية الفعلية',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال الكمية';
                          }
                          if (double.tryParse(value) == null) {
                            return 'يرجى إدخال رقم صحيح';
                          }
                          if (double.parse(value) < 0) {
                            return 'الكمية لا يمكن أن تكون سالبة';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 24.h),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Text(
                                'إلغاء',
                                style: AppTextStyles.body16DarkBlueSemiBold,
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: GradientButton(
                              onPressed: () async {
                                _saveQuantity();
                              },
                              text: 'حفظ',
                              icon: Icons.check,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
