import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../data/models/request_item/request_item.dart';
import '../../../logic/sales_request_cubit/sales_request_cubit.dart';
import '../../../logic/sales_request_cubit/sales_request_state.dart';

class SalesRequestItemsTable extends StatelessWidget {
  const SalesRequestItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesRequestCubit, SalesRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded:
              (
                date,
                items,
                subtotal,
                discount,
                totalAmount,
                notes,
                filteredClients,
                selectedClient,
                filteredItems,
                selectedItem,
              ) {
                if (items.isEmpty) {
                  return SectionCard(
                    title: 'الأصناف المطلوبة',
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.r),
                        child: Column(
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 48.r,
                              color: AppColors.borderGray,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'لم يتم إضافة أي أصناف بعد',
                              style: AppTextStyles.body16GrayMedium,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'اضغط على "إضافة صنف" لبدء إضافة الأصناف',
                              style: AppTextStyles.caption13GrayRegular,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundPrimary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.borderGray.colorWithOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.mainBlue, AppColors.darkBlue],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.inventory_2,
                              color: Colors.white,
                              size: 20.r,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'الأصناف المطلوبة (${items.length})',
                              style: AppTextStyles.body18WhiteSemiBold,
                            ),
                          ],
                        ),
                      ),

                      // items contents
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ProductItemTile(item: item);
                        },
                      ),
                    ],
                  ),
                );
              },
          error: (message) => SectionCard(
            title: 'الأصناف المطلوبة',
            child: Center(
              child: Text(
                message,
                style: AppTextStyles.body14GrayRegular.copyWith(
                  color: AppColors.red,
                ),
              ),
            ),
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}

class ProductItemTile extends StatelessWidget {
  final RequestItem item;

  const ProductItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      elevation: 2,
      shadowColor: AppColors.borderGray.colorWithOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ExpansionTile(
        // =======================================================
        // 1. العنوان (الحالة المغلقة - Collapsed State)
        // =======================================================
        title: _buildCollapsedTitle(),

        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        childrenPadding: EdgeInsets.zero,
        shape: const Border(),
        collapsedShape: const Border(),

        // =======================================================
        // 2. المحتوى (الحالة المفتوحة - Expanded State)
        // =======================================================
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: _buildExpandedContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // معلومات المنتج الأساسية
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: AppTextStyles.body14DarkBlueSemiBold,
                overflow: TextOverflow.ellipsis,
              ),
              4.spacingVertical,
              Text(
                'الوحدة: ${item.unit}',
                style: AppTextStyles.caption13GrayRegular,
              ),
            ],
          ),
        ),

        12.spacingHorizontal,

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${item.specialPrice ?? item.price} د.أ',
              style: AppTextStyles.body14DarkBlueSemiBold,
            ),
            4.spacingVertical,
            Text(
              'الكمية: ${item.quantity}',
              style: AppTextStyles.caption13GrayRegular,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedContent(BuildContext context) {
    return Column(
      children: [
        const Divider(),

        12.spacingVertical,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الكمية:', style: AppTextStyles.caption13GrayMedium),
            QuantityDropdown(
              value: item.quantity,
              max: item.availableQuantity,
              onChanged: (newQuantity) {
                context.read<SalesRequestCubit>().updateItemQuantity(
                  item.itemId,
                  newQuantity,
                );
              },
            ),
          ],
        ),
        16.spacingVertical,
        BlocSelector<SalesRequestCubit, SalesRequestState, RequestItem>(
          selector: (state) {
            return state.maybeWhen(
              loaded: (_, items, _, _, _, _, _, _, _, _) =>
                  items.firstWhere((item) => item.itemId == this.item.itemId),
              orElse: () => item,
            );
          },
          builder: (context, requestItem) {
            AppLogger().info('Request Item: ${requestItem.toJson()}');
            return SpecialPriceSwitch(
              initialValue: requestItem.specialPrice != null,
              initialPrice: requestItem.specialPrice?.toString(),
              onChanged: (value) {
                context.read<SalesRequestCubit>().onSwitchAddSpecialPrice(
                  value,
                  item.itemId,
                );
              },
              onPriceChanged: (price) {
                context.read<SalesRequestCubit>().updateItemSpecialPrice(
                  item.itemId,
                  price,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class SpecialPriceSwitch extends StatefulWidget {
  final bool initialValue;
  final String? initialPrice;
  final void Function(bool value) onChanged;
  final void Function(String price)? onPriceChanged;

  const SpecialPriceSwitch({
    super.key,
    this.initialValue = false,
    this.initialPrice,
    required this.onChanged,
    this.onPriceChanged,
  });

  @override
  State<SpecialPriceSwitch> createState() => _SpecialPriceSwitchState();
}

class _SpecialPriceSwitchState extends State<SpecialPriceSwitch> {
  late bool _isEnabled;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.initialValue;
    _priceController = TextEditingController(text: widget.initialPrice ?? '');
  }

  @override
  void didUpdateWidget(SpecialPriceSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    // تحديث الحالة عند تغيير القيم من الخارج
    if (widget.initialValue != oldWidget.initialValue) {
      _isEnabled = widget.initialValue;
    }

    // تحديث النص في الـ Controller عند تغيير initialPrice
    if (widget.initialPrice != oldWidget.initialPrice) {
      _priceController.text = widget.initialPrice ?? '';
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isEnabled = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'إضافة سعر خاص للعميل',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 60.w,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _isEnabled,
                onChanged: _toggleSwitch,
              ),
            ),
          ],
        ),
        if (_isEnabled)
          Padding(
            padding: EdgeInsetsDirectional.all(10.0.h),
            child: TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'أدخل السعر',
                labelStyle: AppTextStyles.body16GrayMedium,
                filled: true,
                fillColor: AppColors.fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.lightGray,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: AppColors.lightGray,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.mainBlue, width: 2.0),
                ),
              ),
              onChanged: widget.onPriceChanged,
            ),
          ),
      ],
    );
  }
}
