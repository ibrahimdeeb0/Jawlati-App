import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import 'package:jawlati/core/widgets/index.dart';

import '../../data/model/invoice/invoice_model.dart';
import '../../logic/invoices_view_cubit/invoices_view_cubit.dart';
import '../../logic/invoices_view_cubit/invoices_view_state.dart';
import 'widgets/view_invoices_widgets/filter_options_bottom_sheet.dart';
import 'widgets/view_invoices_widgets/invoices_summary_card.dart';
import 'widgets/view_invoices_widgets/invoices_list.dart';
import 'widgets/view_invoices_widgets/empty_invoices_state.dart';
import 'widgets/view_invoices_widgets/sort_options_bottom_sheet.dart';

class ViewInvoicesScreen extends StatelessWidget {
  const ViewInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesViewCubit, InvoicesViewState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: MyAppBar(
              title: 'فواتير المبيعات',
              subTitle: _getSubtitle(state),
              actions: _getActionButtons(context),
            ),
            body: RefreshIndicator(
              onRefresh: () =>
                  context.read<InvoicesViewCubit>().refreshInvoices(),
              child: _buildBody(context, state),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _navigateToAddInvoice(context),
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, InvoicesViewState state) {
    return state.when(
      initial: () => _LoadingView(),
      loading: () => _LoadingView(),
      loaded:
          (invoices, filteredInvoices, searchQuery, selectedFilter, sortBy) {
            final displayInvoices = filteredInvoices ?? invoices;

            if (invoices.isEmpty) {
              return const EmptyInvoicesState();
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  // Search Bar
                  TextFieldSearchBar(
                    searchQuery: searchQuery,
                    searchHint: 'البحث برقم الفاتورة أو اسم العميل',
                    onSearchChanged: (query) =>
                        context.read<InvoicesViewCubit>().searchInvoices(query),
                  ),

                  16.spacingVertical,

                  // Summary Card
                  InvoicesSummaryCard(invoices: invoices),

                  16.spacingVertical,

                  // Invoices List
                  InvoicesList(
                    invoices: displayInvoices,
                    onInvoicePressed: (invoice) =>
                        _navigateToInvoiceDetails(context, invoice),
                    onInvoiceDeleted: (invoice) =>
                        _showDeleteConfirmation(context, invoice),
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
                  context.read<InvoicesViewCubit>().refreshInvoices(),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}

String _getSubtitle(InvoicesViewState state) {
  return state.maybeWhen(
    loaded: (invoices, _, _, _, _) => '${invoices.length} فاتورة',
    orElse: () => '',
  );
}

List<Widget> _getActionButtons(BuildContext context) {
  return [
    // Filter Button
    AppIconActionButton(
      onPressed: () => _showFilterOptions(context),
      icon: Icons.filter_alt_outlined,
      iconColor: Colors.white,
      iconSize: 20.r,
      padding: 6.r,
      backgroundColor: Colors.white.colorWithOpacity(0.2),
      margin: EdgeInsets.only(left: 8.w),
    ),

    // Sort Button
    AppIconActionButton(
      onPressed: () => _showSortOptions(context),
      icon: Icons.sort,
      iconColor: Colors.white,
      iconSize: 20.r,
      padding: 6.r,
      backgroundColor: Colors.white.colorWithOpacity(0.2),
    ),
  ];
}

void _showFilterOptions(BuildContext context) {
  final cubit = context.read<InvoicesViewCubit>();

  AppBottomSheet.showModal(
    context: context,
    title: 'تصفية الفواتير',
    content: BlocProvider.value(
      value: cubit,
      child: const FilterOptionsBottomSheet(),
    ),
  );
}

void _showSortOptions(BuildContext context) {
  final cubit = context.read<InvoicesViewCubit>();

  AppBottomSheet.showModal(
    context: context,
    title: 'ترتيب الفواتير',
    content: BlocProvider.value(
      value: cubit,
      child: const SortOptionsBottomSheet(),
    ),
  );
}

void _navigateToAddInvoice(BuildContext context) {
  context.pushReplacementNamed(AppRouterConstants.addInvoice);
}

void _navigateToInvoiceDetails(BuildContext context, InvoiceModel invoice) {
  context.pushNamed(
    AppRouterConstants.invoiceDetails,
    arguments: {'invoiceId': invoice.id},
  );
}

void _showDeleteConfirmation(BuildContext context, InvoiceModel invoice) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('تأكيد الحذف'),
      content: Text(
        'هل أنت متأكد من حذف الفاتورة رقم ${invoice.invoiceNumber}؟',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        TextButton(
          onPressed: () {
            context.read<InvoicesViewCubit>().deleteInvoice(invoice.id);
            Navigator.pop(context);
          },
          child: const Text('حذف'),
        ),
      ],
    ),
  );
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              16.spacingVertical,
              Text(
                'جاري تحميل البيانات...',
                style: AppTextStyles.body16DarkBlueSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
