import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../logic/view_receipts_cubit/view_receipts_cubit.dart';
import '../../logic/view_receipts_cubit/view_receipts_state.dart';
import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../widgets/view_receipts_widgets/receipts_summary_card.dart';
import '../widgets/view_receipts_widgets/receipts_list.dart';
import '../widgets/view_receipts_widgets/empty_receipts_state.dart';
import '../widgets/view_receipts_widgets/filter_options_bottom_sheet.dart';
import '../widgets/view_receipts_widgets/sort_options_bottom_sheet.dart';

class ViewReceiptsScreen extends StatelessWidget {
  const ViewReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewReceiptsCubit, ViewReceiptsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: MyAppBar(
              title: 'سندات القبض',
              subTitle: _getSubtitle(state),
              actions: _getActionButtons(context),
            ),
            body: RefreshIndicator(
              onRefresh: () =>
                  context.read<ViewReceiptsCubit>().refreshReceipts(),
              child: _buildBody(context, state),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _navigateToAddReceipt(context),
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ViewReceiptsState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded:
          (
            receipts,
            filteredReceipts,
            totalAmount,
            totalCount,
            selectedFilter,
            selectedSort,
            searchQuery,
          ) {
            if (receipts.isEmpty) {
              return const EmptyReceiptsState();
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  // Search Bar
                  TextFieldSearchBar(
                    searchQuery: searchQuery,
                    searchHint: 'البحث برقم السند أو اسم العميل',
                    onSearchChanged: (query) =>
                        context.read<ViewReceiptsCubit>().searchReceipts(query),
                  ),

                  8.spacingVertical,

                  // Summary Card
                  // ReceiptsSummaryCard(
                  //   receipts: filteredReceipts,
                  //   totalAmount: totalAmount,
                  //   totalCount: totalCount,
                  // ),
                  16.spacingVertical,

                  // Receipts List (Cards)
                  ReceiptsList(
                    receipts: filteredReceipts,
                    onReceiptPressed: (receipt) =>
                        _navigateToReceiptDetails(context, receipt),
                    onReceiptDeleted: (receipt) =>
                        _showDeleteConfirmation(context, receipt),
                  ),
                ],
              ),
            );
          },
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.r, color: Colors.red),
            16.spacingVertical,
            Text(message, textAlign: TextAlign.center),
            16.spacingVertical,
            ElevatedButton(
              onPressed: () =>
                  context.read<ViewReceiptsCubit>().refreshReceipts(),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(ViewReceiptsState state) {
    return state.maybeWhen(
      loaded: (_, __, ___, totalCount, ____, _____, ______) =>
          '$totalCount سند قبض',
      orElse: () => '',
    );
  }

  List<Widget> _getActionButtons(BuildContext context) {
    return [
      // Filter Button
      AppIconActionButton(
        onPressed: () => _showFilterOptions(context),
        icon: Icons.filter_list,
        iconColor: Colors.white,
        iconSize: 20,
        padding: 6.r,
        backgroundColor: Colors.white.colorWithOpacity(0.2),
        margin: EdgeInsets.only(left: 8.w),
      ),

      // Sort Button
      AppIconActionButton(
        onPressed: () => _showSortOptions(context),
        icon: Icons.sort,
        iconColor: Colors.white,
        iconSize: 20,
        padding: 6.r,
        backgroundColor: Colors.white.colorWithOpacity(0.2),
      ),
    ];
  }

  void _showFilterOptions(BuildContext context) {
    final cubit = context.read<ViewReceiptsCubit>();
    AppBottomSheet.showModal(
      context: context,
      title: 'فلترة سندات القبض',
      content: BlocProvider.value(
        value: cubit,
        child: const FilterOptionsBottomSheet(),
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    final cubit = context.read<ViewReceiptsCubit>();
    AppBottomSheet.showModal(
      context: context,
      title: 'ترتيب سندات القبض',
      content: BlocProvider.value(
        value: cubit,
        child: const SortOptionsBottomSheet(),
      ),
    );
  }

  void _navigateToAddReceipt(BuildContext context) {
    Navigator.pushNamed(context, AppRouterConstants.addReceipt);
  }

  void _navigateToReceiptDetails(
    BuildContext context,
    ReceiptVoucherModel receipt,
  ) {
    Navigator.pushNamed(
      context,
      AppRouterConstants.receiptDetails,
      arguments: receipt.id,
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    ReceiptVoucherModel receipt,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text(
          'هل أنت متأكد من حذف سند القبض رقم ${receipt.receiptNumber}؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<ViewReceiptsCubit>().deleteReceipt(receipt.id);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
