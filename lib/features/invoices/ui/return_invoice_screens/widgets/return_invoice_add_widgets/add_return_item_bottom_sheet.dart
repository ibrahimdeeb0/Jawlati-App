import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/helpers/extensions.dart';

import '../../../../data/model/invoice/invoice_model.dart';
import '../../../../data/model/invoice_item/invoice_item.dart';
import '../../../../logic/return_invoice_add_cubit/add_return_invoice_cubit.dart';

class AddReturnItemBottomSheet extends StatefulWidget {
  final InvoiceModel originalInvoice;

  const AddReturnItemBottomSheet({super.key, required this.originalInvoice});

  @override
  State<AddReturnItemBottomSheet> createState() =>
      _AddReturnItemBottomSheetState();
}

class _AddReturnItemBottomSheetState extends State<AddReturnItemBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<InvoiceItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.originalInvoice.items;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _filterItems('');
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = widget.originalInvoice.items;
      } else {
        filteredItems = widget.originalInvoice.items.where((item) {
          return item.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _selectItem(InvoiceItem item) {
    context.read<AddReturnInvoiceCubit>().addReturnItem(
      item,
      1, // الكمية الافتراضية: 1
      null, // بدون سبب افتراضي
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildSearchField(), _buildItemsList()],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: _searchController,
        onChanged: _filterItems,
        style: AppTextStyles.body14DarkBlueRegular,
        decoration: InputDecoration(
          hintText: 'البحث في عناصر الفاتورة...',
          hintStyle: AppTextStyles.body14GrayRegular,
          prefixIcon: Icon(Icons.search, color: AppColors.gray, size: 20.r),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _filterItems('');
                  },
                  icon: Icon(Icons.clear, color: AppColors.gray, size: 20.r),
                )
              : null,
          filled: true,
          fillColor: AppColors.lightBlue.colorWithOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.borderBlue),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Flexible(
      child: filteredItems.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return _buildItemCard(item);
              },
            ),
    );
  }

  Widget _buildItemCard(InvoiceItem item) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: () => _selectItem(item),
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              // Price Container
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.colorWithOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.price.toStringAsFixed(2),
                      style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                        color: AppColors.mainBlue,
                      ),
                    ),
                    Text(
                      'د.أ/${item.unit}',
                      style: AppTextStyles.caption12GrayMedium,
                    ),
                  ],
                ),
              ),

              12.spacingHorizontal,

              // Item Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppTextStyles.body14DarkBlueSemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.spacingVertical,
                    Row(
                      children: [
                        Icon(
                          Icons.straighten,
                          size: 14.r,
                          color: AppColors.gray,
                        ),
                        4.spacingHorizontal,
                        Text(
                          'الوحدة: ${item.unit}',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        12.spacingHorizontal,
                        Icon(
                          Icons.inventory_outlined,
                          size: 14.r,
                          color: AppColors.gray,
                        ),
                        4.spacingHorizontal,
                        Text(
                          'السعر: ${item.price.toStringAsFixed(2)} د.أ',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                      ],
                    ),
                    2.spacingVertical,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.successGreen.colorWithOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'متاح: ${item.quantity} ${item.unit}',
                        style: AppTextStyles.caption12BlueRegular.copyWith(
                          color: AppColors.successGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Add Icon
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue.colorWithOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: AppColors.mainBlue, size: 20.r),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64.r, color: AppColors.gray),
          16.spacingVertical,
          Text(
            'لا توجد عناصر',
            style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
              color: AppColors.gray,
            ),
          ),
          if (_searchController.text.isNotEmpty) ...[
            8.spacingVertical,
            Text(
              'لم يتم العثور على عناصر تطابق "${_searchController.text}"',
              style: AppTextStyles.caption12GrayMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
