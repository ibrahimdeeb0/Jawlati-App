import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/requests/ui/widgets/load_request_widgets/items_bottom_sheet.dart';

import '../../../logic/load_request_cubit/load_request_cubit.dart';

class AddLoadItemCard extends StatelessWidget {
  const AddLoadItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showItemSelector(context),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.lightOrange.colorWithOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.mainOrange,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.mainOrange.colorWithOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.add,
                color: AppColors.mainOrange,
                size: 20.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إضافة صنف للطلب',
                    style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                      color: AppColors.mainOrange,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'اختر الأصناف التي تريد طلبها من المستودع',
                    style: AppTextStyles.caption12GrayMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.mainOrange,
              size: 16.r,
            ),
          ],
        ),
      ),
    );
  }

  void _showItemSelector(
    BuildContext context,
  ) {
    final cubit = context.read<LoadRequestCubit>();
    // ItemBottomSheet.show(
    //   context: context,
    //   onItemsSelected: (items) {
    //     // Handle selected items for load request
    //     // This will be implemented when the proper cubit methods are available
    //     print('Selected items for load request: $items');
    //   },
    // );
    AppBottomSheet.showCustomModal(
      context: context,
      searchFieldParameters: SearchFieldParameters(
        controller: cubit.itemSearchController,
        hintText: 'ابحث عن مادة أو باركود',
        onChanged: cubit.searchItems,
      ),
      title: 'اختيار المادة',
      content: BlocProvider.value(
        value: cubit,
        child: ItemsBottomSheet(
          onItemSelected: (item) {
            // cubit.addItemToInvoice(item);
            cubit.addItemRequest(item);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
