import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';

import '../../../../data/model/enums.dart';
import '../../../../logic/return_invoices_view_cubit/view_return_invoices_cubit.dart';
import '../../../../logic/return_invoices_view_cubit/view_return_invoices_state.dart';
import 'sort_option.dart';

class SortOptionsBottomSheet extends StatelessWidget {
  const SortOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewReturnInvoicesCubit, ViewReturnInvoicesState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (_, __, ___, ____, sortBy, isAscending) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.spacingVertical,
                    ...ReturnInvoiceSortBy.values.map((sort) {
                      final isSelected = sortBy == sort;
                      return SortOption(
                        title: sort.displayName,
                        isSelected: isSelected,
                        isAscending: isSelected ? isAscending : false,
                        onTap: () {
                          context
                              .read<ViewReturnInvoicesCubit>()
                              .sortReturnInvoices(sort);
                          Navigator.pop(context);
                        },
                      );
                    }),
                    16.spacingVertical,
                  ],
                ),
              ),
            );
          },
          orElse: () => SizedBox(
            height: 200.h,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
