import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/load_request_cubit/load_request_cubit.dart';
import '../../../logic/load_request_cubit/load_request_state.dart';
import '../../../data/models/request_item/request_item.dart';
import 'add_load_item_card.dart';

class LoadRequestItemsTable extends StatelessWidget {
  const LoadRequestItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'الأصناف المطلوبة',
      child: BlocBuilder<LoadRequestCubit, LoadRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (date, requestItems, notes, filteredItems) {
              return Padding(
                padding: EdgeInsetsDirectional.only(top: 10.0.h, bottom: 6.0.h),
                child: Column(
                  children: [
                    const AddLoadItemCard(),
                    if (requestItems.isNotEmpty) ...[
                      16.spacingVertical,
                      _buildItemsTable(context, requestItems),
                    ],
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildItemsTable(BuildContext context, List<RequestItem> items) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.lightOrange.colorWithOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'المنتج',
                  style: AppTextStyles.body14DarkBlueSemiBold,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'الكمية',
                  style: AppTextStyles.body14DarkBlueSemiBold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 40.w), // For delete button
            ],
          ),
        ),
        8.spacingVertical,
        ...items.map((item) => _buildItemRow(context, item)),
      ],
    );
  }

  Widget _buildItemRow(BuildContext context, RequestItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.body14DarkBlueRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.spacingVertical,
                Text(
                  'المتاح: ${item.availableQuantity} ${item.unit}',
                  style: AppTextStyles.caption12GrayMedium,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildQuantityDropdown(context, item),
          ),
          12.spacingHorizontal,
          SizedBox(
            width: 40.w,
            child: IconButton(
              onPressed: () {
                context.read<LoadRequestCubit>().removeItem(item.itemId);
              },
              icon: Icon(
                Icons.delete_outline,
                color: AppColors.red,
                size: 20.r,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.red.colorWithOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityDropdown(BuildContext context, RequestItem item) {
    final List<int> quantities = List.generate(
      item.availableQuantity > 100 ? 100 : item.availableQuantity,
      (index) => index + 1,
    );

    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.backgroundPrimary,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: item.quantity,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16.r,
            color: AppColors.mainBlue,
          ),
          style: AppTextStyles.body14DarkBlueRegular,
          dropdownColor: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8.r),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          items: quantities.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  value.toString(),
                  style: AppTextStyles.body14DarkBlueRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
          onChanged: (int? newValue) {
            if (newValue != null) {
              context.read<LoadRequestCubit>().updateItemQuantity(
                    item.itemId,
                    newValue,
                  );
            }
          },
        ),
      ),
    );
  }
}
