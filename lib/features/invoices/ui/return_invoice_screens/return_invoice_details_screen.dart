import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/layout/company_header_card.dart';

import '../../logic/return_invoice_details_cubit/return_invoice_details_cubit.dart';
import '../../logic/return_invoice_details_cubit/return_invoice_details_state.dart';
import 'widgets/return_invoice_details_widgets/return_action_buttons_row.dart';
import 'widgets/return_invoice_details_widgets/return_client_info_card.dart';
import 'widgets/return_invoice_details_widgets/return_invoice_details_app_bar.dart';
import 'widgets/return_invoice_details_widgets/return_invoice_footer_card.dart';
import 'widgets/return_invoice_details_widgets/return_invoice_info_card.dart';
import 'widgets/return_invoice_details_widgets/return_invoice_summary_details.dart';
import 'widgets/return_invoice_details_widgets/return_items_details_table.dart';

class ReturnInvoiceDetailsScreen extends StatelessWidget {
  final String invoiceId;

  const ReturnInvoiceDetailsScreen({
    super.key,
    required this.invoiceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnInvoiceDetailsCubit, ReturnInvoiceDetailsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: ReturnInvoiceDetailsAppBar(
              title: 'تفاصيل فاتورة المرتجع',
              subTitle: _getSubtitle(state),
              actions: [
                IconButton(
                  onPressed: () => _shareInvoice(context, state),
                  icon: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColors.textInverse.colorWithOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.share_outlined,
                      color: AppColors.textInverse,
                      size: 20.r,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _printInvoice(context, state),
                  icon: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColors.textInverse.colorWithOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.print_outlined,
                      color: AppColors.textInverse,
                      size: 20.r,
                    ),
                  ),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () => context
                  .read<ReturnInvoiceDetailsCubit>()
                  .refreshReturnInvoice(),
              child: _buildBody(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ReturnInvoiceDetailsState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (returnInvoice) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              // Company Header
              const CompanyHeaderCard(),
              // const ReturnCompanyHeaderCard(),

              16.spacingVertical,

              // Return Invoice Info Card
              ReturnInvoiceInfoCard(invoice: returnInvoice),

              16.spacingVertical,

              // Client Info Card
              ReturnClientInfoCard(invoice: returnInvoice),

              18.spacingVertical,

              // Return Items Details Table
              ReturnItemsDetailsTable(items: returnInvoice.items),

              18.spacingVertical,

              // Return Invoice Summary
              ReturnInvoiceSummaryDetails(invoice: returnInvoice),

              16.spacingVertical,

              // Footer Card
              ReturnInvoiceFooterCard(invoice: returnInvoice),

              24.spacingVertical,

              // Action Buttons
              ReturnActionButtonsRow(
                onPrint: () => _printInvoice(context, state),
                onShare: () => _shareInvoice(context, state),
              ),

              32.spacingVertical,
            ],
          ),
        );
      },
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.r,
              color: AppColors.errorRed,
            ),
            16.spacingVertical,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                color: AppColors.errorRed,
              ),
            ),
            16.spacingVertical,
            ElevatedButton(
              onPressed: () => context
                  .read<ReturnInvoiceDetailsCubit>()
                  .loadReturnInvoiceDetails(invoiceId),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'إعادة المحاولة',
                style: AppTextStyles.button16WhiteSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(ReturnInvoiceDetailsState state) {
    return state.maybeWhen(
      loaded: (invoice) => 'رقم ${invoice.returnInvoiceNumber ?? invoice.id}',
      orElse: () => '',
    );
  }

  void _shareInvoice(BuildContext context, ReturnInvoiceDetailsState state) {
    state.maybeWhen(
      loaded: (returnInvoice) {
        // TODO: Implement share functionality
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'مشاركة فاتورة المرتجع...',
              style: AppTextStyles.body14DarkBlueRegular.copyWith(
                color: AppColors.textInverse,
              ),
            ),
            backgroundColor: AppColors.successGreen,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        );
      },
      orElse: () {},
    );
  }

  void _printInvoice(BuildContext context, ReturnInvoiceDetailsState state) {
    state.maybeWhen(
      loaded: (returnInvoice) {
        // TODO: Implement print functionality
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'طباعة فاتورة المرتجع...',
              style: AppTextStyles.body14DarkBlueRegular.copyWith(
                color: AppColors.textInverse,
              ),
            ),
            backgroundColor: AppColors.infoBlue,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        );
      },
      orElse: () {},
    );
  }
}
