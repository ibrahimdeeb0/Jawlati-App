import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/toast_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../data/models/request_item/request_item.dart';
import '../../logic/sales_request_cubit/sales_request_cubit.dart';
import '../../logic/sales_request_cubit/sales_request_state.dart';
import '../widgets/sales_request_widgets/item_bottom_sheet.dart';
import '../widgets/sales_request_widgets/sales_request_header_card.dart';
import '../widgets/sales_request_widgets/client_selector_card.dart';
import '../widgets/sales_request_widgets/sales_request_items_table.dart';
import '../widgets/sales_request_widgets/sales_request_summary_card.dart';
import '../widgets/sales_request_widgets/select_client_bottom_sheet.dart';

class AddSalesRequestScreen extends StatelessWidget {
  const AddSalesRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesRequestCubit, SalesRequestState>(
      listener: (context, state) {
        state.whenOrNull(
          submissionSuccess: () {
            ToastHelper.showToast(
              message: 'تم إنشاء الطلب بنجاح',
              type: ToastType.success,
            );
            context.popWithResult(true);
          },
          submissionFailure: (error) {
            ToastHelper.showToast(
              message: 'فشل الحفظ: $error',
              type: ToastType.error,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _InitialView(),
          loading: () => _LoadingView(),
          loaded: (
            date,
            items,
            subtotal,
            discount,
            totalAmount,
            notes,
            filteredClients,
            selectedClient,
            filteredItems,
            selectedItem,
          ) {
            return _buildLoadedUI(
              context: context,
              items: items,
              subtotal: subtotal,
              discount: discount,
              totalAmount: totalAmount,
              isSubmitting: false,
            );
          },
          error: (message) => _ErrorView(message: message),
          //
          submissionInProgress: () {
            final lastState = context.read<SalesRequestCubit>().state;
            if (lastState is Loaded) {
              return _buildLoadedUI(
                context: context,
                items: lastState.items,
                subtotal: lastState.subtotal,
                discount: lastState.discount,
                totalAmount: lastState.totalAmount,
                isSubmitting: true,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Directionality _buildLoadedUI({
    required BuildContext context,
    required List<RequestItem> items,
    required double subtotal,
    required double discount,
    required double totalAmount,
    required bool isSubmitting,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب مبيعات جديد',
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    const SalesRequestHeaderCard(),

                    16.spacingVertical,

                    ClientSelectorCard(
                      onTap: () => _showClientBottomSheet(context),
                    ),

                    16.spacingVertical,

                    // Add Item Section
                    AddItemCard(
                      onAddPressed: () => _showItemBottomSheet(context),
                      onScanBarcode: () => _showItemBottomSheet(context),
                    ),

                    16.spacingVertical,

                    const SalesRequestItemsTable(),
                  ],
                ),
              ),
            ),
            SalesRequestSummaryCard(
              subtotal: subtotal,
              totalAmount: totalAmount,
              discount: discount,
              isSubmitting: isSubmitting,
            ),
          ],
        ),
      ),
    );
  }

  void _showClientBottomSheet(BuildContext context) {
    final cubit = context.read<SalesRequestCubit>();
    AppBottomSheet.showCustomModal(
      context: context,
      searchFieldParameters: SearchFieldParameters(
        controller: cubit.clientSearchController,
        hintText: 'ابحث عن عميل',
        onChanged: cubit.searchClients,
        // onClear: cubit.clearClient,
      ),
      title: 'اختيار العميل',
      content: BlocProvider.value(
        value: cubit,
        child: SelectClientSheet(),
      ),
    );
  }

  void _showItemBottomSheet(BuildContext context) {
    final cubit = context.read<SalesRequestCubit>();

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
        child: ItemBottomSheet(
          onItemSelected: (item) {
            cubit.addItemToRequest(item);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class _InitialView extends StatelessWidget {
  const _InitialView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب مبيعات جديد',
        ),
        body: Center(
          child: Text(
            'جاري التحضير...',
            style: AppTextStyles.body16GrayMedium,
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب مبيعات جديد',
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب مبيعات جديد',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64.r,
                color: AppColors.red,
              ),
              16.spacingVertical,
              Text(
                'حدث خطأ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.red,
                    ),
              ),
              8.spacingVertical,
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16GrayMedium,
              ),
              16.spacingVertical,
              LegacyGradientButton(
                onPressed: () =>
                    context.read<SalesRequestCubit>().refreshData(),
                text: 'إعادة المحاولة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
