import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/widgets/layout/company_header_card.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/invoices/printing/pdf_invoice_service.dart';
import 'package:jawlati/features/invoices/printing/pdf_receipt_service.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../logic/invoice_details_cubit/invoice_details_cubit.dart';
import '../../logic/invoice_details_cubit/invoice_details_state.dart';
import 'widgets/invoice_details_widgets/invoice_details_app_bar.dart';
import 'widgets/invoice_details_widgets/invoice_info_card.dart';
import 'widgets/invoice_details_widgets/client_info_card.dart';
import 'widgets/invoice_details_widgets/items_details_table.dart';
import 'widgets/invoice_details_widgets/invoice_summary_details.dart';
import 'widgets/invoice_details_widgets/invoice_footer_card.dart';
import 'widgets/invoice_details_widgets/action_buttons_row.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  final String invoiceId;

  const InvoiceDetailsScreen({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceDetailsCubit, InvoiceDetailsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: InvoiceDetailsAppBar(
              title: 'تفاصيل الفاتورة',
              subTitle: _getSubtitle(state),
              actions: [
                AppIconActionButton(
                  onPressed: () => _shareInvoice(context, state),
                  icon: Icons.share_outlined,
                  iconSize: 20.r,
                ),
                AppIconActionButton(
                  onPressed: () => _printInvoice(context, state),
                  icon: Icons.print_outlined,
                  iconSize: 20.r,
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () =>
                  context.read<InvoiceDetailsCubit>().refreshInvoice(),
              child: _buildBody(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, InvoiceDetailsState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (invoice) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              // Company Header
              const CompanyHeaderCard(),

              16.spacingVertical,

              // Invoice Info Card
              InvoiceInfoCard(invoice: invoice),

              16.spacingVertical,

              // Client Info Card
              ClientInfoCard(invoice: invoice),

              18.spacingVertical,

              // Items Details Table
              ItemsDetailsTable(items: invoice.items),

              18.spacingVertical,

              // Invoice Summary
              InvoiceSummaryDetails(invoice: invoice),

              16.spacingVertical,

              // Footer Card
              InvoiceFooterCard(invoice: invoice),

              24.spacingVertical,

              // Action Buttons
              ActionButtonsRow(
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
            Icon(Icons.error_outline, size: 64.r, color: Colors.red),
            16.spacingVertical,
            Text(message, textAlign: TextAlign.center),
            16.spacingVertical,
            ElevatedButton(
              onPressed: () => context
                  .read<InvoiceDetailsCubit>()
                  .loadInvoiceDetails(invoiceId),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(InvoiceDetailsState state) {
    return state.maybeWhen(
      loaded: (invoice) => 'رقم ${invoice.invoiceNumber ?? invoice.id}',
      orElse: () => '',
    );
  }

  void _shareInvoice(BuildContext context, InvoiceDetailsState state) {
    state.maybeWhen(
      loaded: (invoice) async {
        try {
          final bytes = await PdfInvoiceService.buildInvoicePdf(
            invoice: invoice,
          );
          final dir = await getTemporaryDirectory();
          final file = File(
            '${dir.path}/invoice_${invoice.invoiceNumber ?? invoice.id}.pdf',
          );
          await file.writeAsBytes(bytes, flush: true);

          final params = ShareParams(
            text: 'فاتورة ${invoice.invoiceNumber ?? invoice.id}',
            files: [XFile(file.path)],
          );

          await SharePlus.instance.share(params);
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('فشل المشاركة: $e')));
        }
      },
      orElse: () {},
    );
  }

  void _printInvoice(BuildContext context, InvoiceDetailsState state) {
    state.maybeWhen(
      loaded: (invoice) async {
        const double receiptWidth = 80 * (72 / 25.4);
        final receiptFormat = PdfPageFormat(
          receiptWidth,
          double.infinity,
          marginAll: 5 * (72 / 25.4),
        );
        try {
          final bytes = await PdfReceiptService.buildReceiptPdf(
            invoice: invoice,
          );
          await Printing.layoutPdf(
            onLayout: (PdfPageFormat format) async => bytes,
            format: receiptFormat,
            // receiptFormat,
          );
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('فشل الطباعة: $e')));
        }
      },
      orElse: () {},
    );
  }
}
