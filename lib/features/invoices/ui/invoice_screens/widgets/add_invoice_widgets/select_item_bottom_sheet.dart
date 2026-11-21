import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../../data/model/item/item_model.dart';
import '../../../../logic/invoice_add_cubit/invoice_cubit.dart';
import '../../../../logic/invoice_add_cubit/invoice_state.dart';

class SelectItemBottomSheet extends StatelessWidget {
  final void Function(ItemModel) onItemSelected;
  const SelectItemBottomSheet({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [16.spacingVertical, _buildItemsList()],
    );
  }

  Widget _buildItemsList() {
    return Flexible(
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded:
                (
                  currentTime,
                  currentDate,
                  invoiceItems,
                  subtotal,
                  totalAmount,
                  paidAmount,
                  remainingAmount,
                  notes,
                  selectedClient,
                  filteredItems,
                  filteredClients,
                  selectedPaymentMethod,
                  availableMethods,
                ) {
                  AppLogger().info(
                    'Loaded items: ${filteredItems?.length ?? 0}',
                  );
                  if (filteredItems == null || filteredItems.isEmpty) {
                    return _buildEmptyState();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return _buildItemCard(context, item, false);
                    },
                  );
                },
            error: (message) => _buildErrorState(context, message),
          );
        },
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, ItemModel item, bool isSelected) {
    return SelectableListCard(
      title: item.name,
      leadingIcon: Icons.inventory_2_outlined,
      subtitle: item.barcode,
      subTitleIcon: Icons.qr_code,
      subtitle2: 'الوحدة: ${item.unit}',
      isSelected: isSelected,
      onTap: () => onItemSelected(item),
      primaryColor: AppColors.mainOrange,
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          Icon(Icons.inventory_2_outlined, size: 64.r, color: AppColors.gray),
          SizedBox(height: 16.h),
          Text('لا توجد مواد', style: AppTextStyles.body16GrayMedium),
          // if (_searchController.text.isNotEmpty) ...[
          //   SizedBox(height: 8.h),
          //   Text(
          //     'لم يتم العثور على مواد تطابق "${_searchController.text}"',
          //     style: AppTextStyles.caption12GrayMedium,
          //     textAlign: TextAlign.center,
          //   ),
          // ],
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 64.r, color: Colors.red),
          SizedBox(height: 16.h),
          Text('حدث خطأ', style: AppTextStyles.body16GrayMedium),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTextStyles.caption12GrayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => context.read<InvoiceCubit>().searchItems(''),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
