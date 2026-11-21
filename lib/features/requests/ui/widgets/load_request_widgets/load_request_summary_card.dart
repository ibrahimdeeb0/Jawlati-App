import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/load_request_cubit/load_request_cubit.dart';
import '../../../logic/load_request_cubit/load_request_state.dart';

class LoadRequestSummaryCard extends StatelessWidget {
  const LoadRequestSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<LoadRequestCubit, LoadRequestState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (date, requestItems, notes, filteredItems) {
                  return Column(
                    children: [
                      _buildSummaryRow(
                        'إجمالي الكمية',
                        '${requestItems.length} قطعة',
                        Icons.numbers_outlined,
                      ),
                      16.spacingVertical,
                      _buildSubmitButton(context, requestItems.isNotEmpty),
                    ],
                  );
                },
                orElse: () => _buildSubmitButton(context, false),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.r,
          color: AppColors.mainOrange,
        ),
        8.spacingHorizontal,
        Text(
          label,
          style: AppTextStyles.body14GrayRegular,
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.body14DarkBlueSemiBold,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context, bool isEnabled) {
    return BlocBuilder<LoadRequestCubit, LoadRequestState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return GradientButton(
          onPressed: isEnabled && !isLoading
              ? () => context.read<LoadRequestCubit>().submitRequest()
              : () async {},
          text: isLoading ? 'جاري الإرسال...' : 'إرسال الطلب للموافقة',
          width: double.infinity,
          enabled: isEnabled && !isLoading,
        );
      },
    );
  }
}
