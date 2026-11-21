import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../data/models/request_enums.dart';
import '../../logic/requests_cubit/requests_cubit.dart';
import '../../logic/requests_cubit/requests_state.dart';

class RequestsFilterBar extends StatelessWidget {
  const RequestsFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: BlocBuilder<RequestsCubit, RequestsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            loaded: (requests, filteredRequests, selectedFilter, selectedStatus,
                searchQuery) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  16.spacingHorizontal,
                  _buildFilterChip(
                    context,
                    label: 'الكل',
                    isSelected:
                        selectedFilter == null && selectedStatus == null,
                    onTap: () => context.read<RequestsCubit>().clearFilters(),
                  ),
                  8.horizontalSpace,
                  _buildFilterChip(
                    context,
                    label: 'طلبات التحميل',
                    isSelected: selectedFilter == RequestType.load,
                    onTap: () => context
                        .read<RequestsCubit>()
                        .filterByType(RequestType.load),
                    icon: Icons.local_shipping_outlined,
                    count: context.read<RequestsCubit>().loadRequestsCount,
                  ),
                  8.horizontalSpace,
                  _buildFilterChip(
                    context,
                    label: 'طلبات المبيعات',
                    isSelected: selectedFilter == RequestType.sales,
                    onTap: () => context
                        .read<RequestsCubit>()
                        .filterByType(RequestType.sales),
                    icon: Icons.receipt_long_outlined,
                    count: context.read<RequestsCubit>().salesRequestsCount,
                  ),
                  8.horizontalSpace,
                  _buildFilterChip(
                    context,
                    label: 'قيد المراجعة',
                    isSelected: selectedStatus == RequestStatus.pending,
                    onTap: () => context
                        .read<RequestsCubit>()
                        .filterByStatus(RequestStatus.pending),
                    icon: Icons.hourglass_empty_outlined,
                    count: context.read<RequestsCubit>().pendingRequestsCount,
                  ),
                  8.horizontalSpace,
                  _buildFilterChip(
                    context,
                    label: 'تمت الموافقة',
                    isSelected: selectedStatus == RequestStatus.approved,
                    onTap: () => context
                        .read<RequestsCubit>()
                        .filterByStatus(RequestStatus.approved),
                    icon: Icons.check_circle_outline,
                    count: context.read<RequestsCubit>().approvedRequestsCount,
                  ),
                  16.spacingHorizontal,
                ],
              );
            },
            error: (message) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    IconData? icon,
    int? count,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.mainOrange : AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: isSelected ? AppColors.mainOrange : AppColors.borderGray,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16.r,
                color:
                    isSelected ? AppColors.backgroundPrimary : AppColors.gray,
              ),
              4.horizontalSpace,
            ],
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.body14DarkBlueRegular.copyWith(
                      color: AppColors.backgroundPrimary,
                      fontWeight: FontWeight.w600,
                    )
                  : AppTextStyles.body14GrayRegular,
            ),
            if (count != null && count > 0) ...[
              4.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.backgroundPrimary.colorWithOpacity(0.2)
                      : AppColors.mainOrange.colorWithOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.backgroundPrimary
                        : AppColors.mainOrange,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

extension on int {
  Widget get horizontalSpace => SizedBox(width: w);
}
