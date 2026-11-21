import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';

import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import 'package:jawlati/core/widgets/index.dart';

import '../../data/model/enums.dart';
import '../../data/model/return_invoice_model/return_invoice_model.dart';
import '../../logic/return_invoices_view_cubit/view_return_invoices_cubit.dart';
import '../../logic/return_invoices_view_cubit/view_return_invoices_state.dart';
import 'widgets/return_invoices_view_widgets/filter_options_bottom_sheet.dart';
import 'widgets/return_invoices_view_widgets/sort_options_bottom_sheet.dart';

class ViewReturnInvoicesScreen extends StatelessWidget {
  const ViewReturnInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewReturnInvoicesCubit, ViewReturnInvoicesState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: MyAppBar(
              title: 'فواتير المرتجع',
              subTitle: _getSubtitle(state),
              actions: _getActionButtons(context),
            ),
            body: RefreshIndicator(
              onRefresh: () => context
                  .read<ViewReturnInvoicesCubit>()
                  .refreshReturnInvoices(),
              child: _buildBody(context, state),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _navigateToAddReturnInvoice(context),
              backgroundColor: AppColors.buttonPrimary,
              child: Icon(
                Icons.assignment_return,
                color: AppColors.textInverse,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ViewReturnInvoicesState state) {
    return state.when(
      initial: () => const _LoadingView(),
      loading: () => const _LoadingView(),
      loaded:
          (
            returnInvoices,
            filteredInvoices,
            searchQuery,
            selectedFilter,
            sortBy,
            isAscending,
          ) {
            final displayInvoices = filteredInvoices ?? returnInvoices;

            if (returnInvoices.isEmpty) {
              return EmptyStateWidget.noInvoices(
                action: ElevatedButton.icon(
                  onPressed: () => _navigateToAddReturnInvoice(context),
                  icon: Icon(Icons.add, color: AppColors.textInverse),
                  label: Text(
                    'إضافة فاتورة مرتجع',
                    style: AppTextStyles.button16WhiteSemiBold,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              );
            }

            // if (displayInvoices.isEmpty && searchQuery.isNotEmpty) {
            //   return EmptyStateWidget.noSearchResults(searchQuery: searchQuery);
            // }

            if (displayInvoices.isEmpty &&
                selectedFilter != ReturnInvoiceFilter.all) {
              return EmptyStateWidget.noFilterResults(
                filterName: selectedFilter.displayName,
              );
            }

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  // Search and Filter Bar
                  TextFieldSearchBar(
                    searchQuery: searchQuery,
                    searchHint: 'البحث برقم الفاتورة أو اسم العميل',
                    onSearchChanged: (query) => context
                        .read<ViewReturnInvoicesCubit>()
                        .searchReturnInvoices(query),
                  ),

                  16.spacingVertical,

                  // Summary Statistics
                  _buildSummaryStats(returnInvoices),

                  16.spacingVertical,

                  // Return Invoices List
                  _buildReturnInvoicesList(
                    context,
                    displayInvoices,
                    searchQuery,
                  ),
                ],
              ),
            );
          },
      error: (message) => _ErrorView(
        message: message,
        onRetry: () =>
            context.read<ViewReturnInvoicesCubit>().refreshReturnInvoices(),
      ),
    );
  }

  Widget _buildSummaryStats(List<ReturnInvoiceModel> invoices) {
    final totalInvoices = invoices.length;
    final processedInvoices = invoices
        .where((inv) => inv.status == ReturnInvoiceStatus.processed)
        .length;
    final pendingInvoices = invoices
        .where(
          (inv) =>
              inv.status == ReturnInvoiceStatus.draft ||
              inv.status == ReturnInvoiceStatus.confirmed,
        )
        .length;
    final totalRefundAmount = invoices.fold<double>(
      0.0,
      (sum, inv) => sum + inv.refundAmount,
    );

    return SummaryStatsCard(
      stats: [
        StatItem(
          label: 'إجمالي فواتير المرتجع',
          value: totalInvoices.toString(),
          icon: Icons.receipt_long,
          color: AppColors.mainBlue,
        ),
        StatItem(
          label: 'فواتير تم معالجتها',
          value: processedInvoices.toString(),
          icon: Icons.check_circle_outline,
          color: AppColors.successGreen,
        ),
        StatItem(
          label: 'فواتير في الانتظار',
          value: pendingInvoices.toString(),
          icon: Icons.pending_outlined,
          color: AppColors.warningOrange,
        ),
        StatItem(
          label: 'إجمالي المبالغ المستردة',
          value: '${totalRefundAmount.toStringAsFixed(2)} د.أ',
          icon: Icons.monetization_on_outlined,
          color: AppColors.errorRed,
        ),
      ],
    );
  }

  Widget _buildReturnInvoicesList(
    BuildContext context,
    List<ReturnInvoiceModel> invoices,
    String searchQuery,
  ) {
    if (invoices.isEmpty) {
      return EmptyStateWidget.noSearchResults(searchQuery: searchQuery);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.assignment_return,
              color: AppColors.mainBlue,
              size: 20.r,
            ),
            8.horizontalSpace,
            Text(
              'قائمة فواتير المرتجع (${invoices.length})',
              style: AppTextStyles.body16DarkBlueSemiBold,
            ),
          ],
        ),
        12.spacingVertical,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: invoices.length,
          separatorBuilder: (context, index) => 12.spacingVertical,
          itemBuilder: (context, index) => _ReturnInvoiceCard(
            invoice: invoices[index],
            onTap: () => _navigateToInvoiceDetails(context, invoices[index]),
          ),
        ),
      ],
    );
  }

  String _getSubtitle(ViewReturnInvoicesState state) {
    return state.maybeWhen(
      loaded: (invoices, _, __, ___, ____, _____) =>
          '${invoices.length} فاتورة مرتجع',
      orElse: () => '',
    );
  }

  List<Widget> _getActionButtons(BuildContext context) {
    final cubit = context.read<ViewReturnInvoicesCubit>();
    return [
      Container(
        margin: EdgeInsets.only(left: 8.w),
        child: IconButton(
          onPressed: () => _showFilterOptions(context, cubit),
          icon: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: AppColors.textInverse.colorWithOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppColors.textInverse,
              size: 20.r,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 12.w),
        child: IconButton(
          onPressed: () => _showSortOptions(context, cubit),
          icon: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: AppColors.textInverse.colorWithOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.sort, color: AppColors.textInverse, size: 20.r),
          ),
        ),
      ),
    ];
  }

  void _showFilterOptions(BuildContext context, ViewReturnInvoicesCubit cubit) {
    AppBottomSheet.showModal(
      context: context,
      title: 'تصفية فواتير المرتجع',
      content: BlocProvider.value(
        value: cubit,
        child: const FilterOptionsBottomSheet(),
      ),
    );
  }

  void _showSortOptions(BuildContext context, ViewReturnInvoicesCubit cubit) {
    AppBottomSheet.showModal(
      context: context,
      title: 'ترتيب فواتير المرتجع',
      content: BlocProvider.value(
        value: cubit,
        child: const SortOptionsBottomSheet(),
      ),
    );
  }

  void _navigateToAddReturnInvoice(BuildContext context) {
    // Navigate to add return invoice screen
    context.popAndPushNamed(AppRouterConstants.addReturnInvoice);
  }

  void _navigateToInvoiceDetails(
    BuildContext context,
    ReturnInvoiceModel invoice,
  ) {
    // Navigate to return invoice details screen
    context.pushNamed(
      AppRouterConstants.returnInvoiceDetails,
      arguments: {'invoiceId': invoice.id},
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.mainBlue),
          16.spacingVertical,
          Text(
            'جاري تحميل فواتير المرتجع...',
            style: AppTextStyles.body16DarkBlueSemiBold,
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ErrorView({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.r, color: AppColors.errorRed),
            16.spacingVertical,
            Text(
              'حدث خطأ',
              style: AppTextStyles.heading20BlackBold.copyWith(
                color: AppColors.errorRed,
              ),
            ),
            8.spacingVertical,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.body14GrayRegular,
            ),
            24.spacingVertical,
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, color: AppColors.textInverse),
              label: Text(
                'إعادة المحاولة',
                style: AppTextStyles.button16WhiteSemiBold,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReturnInvoiceCard extends StatelessWidget {
  final ReturnInvoiceModel invoice;
  final VoidCallback onTap;

  const _ReturnInvoiceCard({required this.invoice, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.assignment_return,
                          color: AppColors.mainBlue,
                          size: 20.r,
                        ),
                        8.horizontalSpace,
                        Text(
                          'فاتورة مرتجع ${invoice.returnInvoiceNumber}',
                          style: AppTextStyles.body16DarkBlueSemiBold,
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(invoice.status),
                ],
              ),

              12.spacingVertical,

              // Client and Original Invoice Info
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.fillColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.borderGray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 16.r,
                          color: AppColors.gray,
                        ),
                        4.horizontalSpace,
                        Text(
                          'العميل: ',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Expanded(
                          child: Text(
                            invoice.clientName,
                            style: AppTextStyles.body14DarkBlueSemiBold,
                          ),
                        ),
                      ],
                    ),
                    if (invoice.originalInvoiceNumber != null) ...[
                      4.spacingVertical,
                      Row(
                        children: [
                          Icon(
                            Icons.receipt_outlined,
                            size: 16.r,
                            color: AppColors.gray,
                          ),
                          4.horizontalSpace,
                          Text(
                            'الفاتورة الأصلية: ',
                            style: AppTextStyles.caption12GrayMedium,
                          ),
                          Text(
                            invoice.originalInvoiceNumber!,
                            style: AppTextStyles.body14DarkBlueRegular.copyWith(
                              color: AppColors.mainBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              12.spacingVertical,

              // Items and Return Reason
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'عدد العناصر المرتجعة',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Text(
                          '${invoice.items.length} عنصر',
                          style: AppTextStyles.body14DarkBlueSemiBold,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'سبب المرتجع',
                          style: AppTextStyles.caption12GrayMedium,
                        ),
                        Text(
                          invoice.returnReason.displayName,
                          style: AppTextStyles.body14DarkBlueRegular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              12.spacingVertical,

              // Amount and Date Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المبلغ المسترد',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                      Text(
                        '${invoice.refundAmount.toStringAsFixed(2)} د.أ',
                        style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                          color: AppColors.errorRed,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تاريخ المرتجع',
                        style: AppTextStyles.caption12GrayMedium,
                      ),
                      Text(
                        DateTimeHelper.formatShortDate(invoice.createdAt),
                        style: AppTextStyles.body14DarkBlueRegular,
                      ),
                    ],
                  ),
                ],
              ),

              if (invoice.processedBy != null) ...[
                12.spacingVertical,
                Row(
                  children: [
                    Icon(
                      Icons.person_pin,
                      size: 16.r,
                      color: AppColors.successGreen,
                    ),
                    4.horizontalSpace,
                    Text(
                      'تم المعالجة بواسطة: ',
                      style: AppTextStyles.caption12GrayMedium,
                    ),
                    Text(
                      invoice.processedBy!,
                      style: AppTextStyles.caption12BlueRegular.copyWith(
                        color: AppColors.successGreen,
                      ),
                    ),
                  ],
                ),
              ],

              if (invoice.notes.isNotEmpty) ...[
                8.spacingVertical,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.note_outlined,
                        size: 14.r,
                        color: AppColors.mainBlue,
                      ),
                      4.horizontalSpace,
                      Expanded(
                        child: Text(
                          invoice.notes,
                          style: AppTextStyles.caption12BlueRegular.copyWith(
                            color: AppColors.mainBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(ReturnInvoiceStatus status) {
    switch (status) {
      case ReturnInvoiceStatus.draft:
        return StatusChip.neutral(
          text: status.displayName,
          icon: Icons.edit_outlined,
        );
      case ReturnInvoiceStatus.confirmed:
        return StatusChip.info(
          text: status.displayName,
          icon: Icons.check_outlined,
        );
      case ReturnInvoiceStatus.processed:
        return StatusChip.success(
          text: status.displayName,
          icon: Icons.done_all_outlined,
        );
      case ReturnInvoiceStatus.cancelled:
        return StatusChip.error(
          text: status.displayName,
          icon: Icons.cancel_outlined,
        );
    }
  }
}
