import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../../logic/add_receipt_cubit/add_receipt_cubit.dart';
import 'client_bottom_sheet_content.dart';

class ClientSelectorCard extends StatelessWidget {
  final Client? selectedClient;
  final List<Client> filteredClients;
  final Function(Client) onClientSelected;
  final Function(String) onSearch;

  const ClientSelectorCard({
    super.key,
    this.selectedClient,
    required this.filteredClients,
    required this.onClientSelected,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'العميل *',
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showClientBottomSheet(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedClient != null
                      ? AppColors.mainBlue
                      : AppColors.lightGray,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12.r),
                color: selectedClient != null
                    ? AppColors.mainBlue.colorWithOpacity(0.05)
                    : Colors.transparent,
              ),
              child: selectedClient != null
                  ? _buildSelectedClient()
                  : _buildEmptyState(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedClient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedClient!.name,
          style: AppTextStyles.body14DarkBlueMedium,
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Icon(
              Icons.phone_outlined,
              size: 14.sp,
              color: AppColors.gray,
            ),
            SizedBox(width: 4.w),
            Text(
              selectedClient!.phone,
              style: AppTextStyles.caption12GrayMedium,
            ),
            const Spacer(),
            if (selectedClient!.balance != 0)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: selectedClient!.balance > 0
                      ? Colors.green.colorWithOpacity(0.1)
                      : Colors.red.colorWithOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  '${selectedClient!.balance.toStringAsFixed(2)} د.أ',
                  style: AppTextStyles.caption12GrayMedium.copyWith(
                    color:
                        selectedClient!.balance > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Row(
      children: [
        Icon(
          Icons.add_circle_outline,
          size: 20.sp,
          color: AppColors.gray,
        ),
        SizedBox(width: 12.w),
        Text(
          'اختر العميل',
          style: AppTextStyles.body14GrayRegular,
        ),
        const Spacer(),
        Icon(
          Icons.keyboard_arrow_down,
          size: 20.sp,
          color: AppColors.gray,
        ),
      ],
    );
  }

  void _showClientBottomSheet(BuildContext context) {
    final cubit = context.read<AddReceiptCubit>();
    AppBottomSheet.showCustomModal(
      context: context,
      searchFieldParameters: SearchFieldParameters(
        controller: cubit.clientSearchController,
        hintText: 'ابحث عن عميل',
        onChanged: cubit.searchClients,
      ),
      content: BlocProvider.value(
        value: cubit,
        child: const SelectClientSheet(),
      ),
    );
  }
}
