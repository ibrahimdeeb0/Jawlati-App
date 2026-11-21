import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:intl/intl.dart' as intl;
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart'; // افترضت وجود هذا الملف
import 'package:jawlati/core/theme/assets_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/model/invoice/invoice_model.dart';

class PdfInvoiceService {
  static Future<Uint8List> buildInvoicePdf({
    required InvoiceModel invoice,
  }) async {
    final pdf = pw.Document();

    final arabicFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/tajawal/Tajawal-Regular.ttf'),
    );
    final arabicFontBold = pw.Font.ttf(
      await rootBundle.load('assets/fonts/tajawal/Tajawal-Bold.ttf'),
    );

    const double paperWidth = 58 * (72 / 25.4);
    //? الطول يمكن أن يكون كبيراً، والمحتوى سيحدد الطول الفعلي.
    const double paperHeight = 800 * (72 / 25.4);
    final pageFormat = PdfPageFormat(
      paperWidth,
      paperHeight,
      marginAll: 3 * (72 / 25.4),
    );

    //? تحميل شعار الشركة (اختياري)
    pw.ImageProvider? companyLogo;
    try {
      companyLogo = pw.MemoryImage(
        (await rootBundle.load(
          AppAssetsImages.imgAppLogo,
        )).buffer.asUint8List(),
      );
    } catch (e) {
      AppLogger().error("Could not load logo: $e");
      companyLogo = null;
    }

    final baseTextStyle = pw.TextStyle(font: arabicFont, fontSize: 10);
    final boldTextStyle = pw.TextStyle(font: arabicFontBold, fontSize: 10);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: pageFormat,
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicFontBold),
        header: (context) =>
            _buildHeader(context, invoice, boldTextStyle, companyLogo),
        footer: (context) => _buildFooter(context, boldTextStyle),
        build: (context) {
          return [
            //?  --- معلومات الفاتورة والعميل (تحاكي InvoiceInfoCard و ClientInfoCard) ---
            _buildInfoCards(invoice, baseTextStyle, boldTextStyle),
            pw.SizedBox(height: 24),

            //? --- جدول الأصناف (يحاكي ItemsDetailsTable) ---
            _buildItemsTable(invoice, baseTextStyle, boldTextStyle),
            pw.SizedBox(height: 24),

            //? --- ملخص الفاتورة (يحاكي InvoiceSummaryDetails) ---
            _buildSummary(invoice, baseTextStyle, boldTextStyle),
            pw.SizedBox(height: 32),

            //? --- ملاحظات إضافية (تحاكي InvoiceFooterCard) ---
            _buildNotes(invoice, baseTextStyle),
          ];
        },
      ),
    );

    return pdf.save();
  }

  // --- 1. رأس الصفحة (يحاكي CompanyHeaderCard) ---
  static pw.Widget _buildHeader(
    pw.Context context,
    InvoiceModel invoice,
    pw.TextStyle boldStyle,
    pw.ImageProvider? companyLogo,
  ) {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            //? تفاصيل الشركة
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'شركة توزيع تجريبية',
                  style: boldStyle.copyWith(
                    fontSize: 18,
                    color: PdfColors.blueGrey800,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'عمان - الأردن',
                  style: boldStyle.copyWith(fontSize: 11),
                ),
                pw.Text(
                  'demo@example.com',
                  style: boldStyle.copyWith(fontSize: 11),
                ),
              ],
            ),
            //? الشعار
            if (companyLogo != null)
              pw.Container(
                height: 60,
                width: 60,
                color: PdfColors.blueGrey100,
                child: pw.Center(
                  child: pw.SizedBox(
                    height: 60,
                    width: 60,
                    child: pw.Image(companyLogo),
                  ),
                ),
              ),
          ],
        ),
        pw.SizedBox(height: 12),
        pw.Divider(color: PdfColors.grey400),
        pw.SizedBox(height: 12),
      ],
    );
  }

  // --- 2. معلومات الفاتورة والعميل ---
  static pw.Widget _buildInfoCards(
    InvoiceModel invoice,
    pw.TextStyle baseStyle,
    pw.TextStyle boldStyle,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(6),
      ),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // معلومات العميل
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'فاتورة إلى:',
                  style: boldStyle.copyWith(color: PdfColors.blueGrey600),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  invoice.clientName,
                  style: boldStyle.copyWith(fontSize: 12),
                ),
                /*  if (invoice.clientPhone != null)
                  pw.Text(invoice.clientPhone!, style: baseStyle),
                if (invoice.clientAddress != null)
                  pw.Text(invoice.clientAddress!, style: baseStyle), */
              ],
            ),
          ),
          pw.SizedBox(width: 20),
          // معلومات الفاتورة
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  'رقم الفاتورة:',
                  invoice.invoiceNumber ?? invoice.id,
                  baseStyle,
                  boldStyle,
                ),
                _buildInfoRow(
                  'تاريخ الإصدار:',
                  DateTimeHelper.formatShortDate(invoice.createdAt),
                  baseStyle,
                  boldStyle,
                ),
                if (invoice.updatedAt != null)
                  _buildInfoRow(
                    'تاريخ الاستحقاق:',
                    DateTimeHelper.formatInvoiceDate(invoice.updatedAt!),
                    baseStyle,
                    boldStyle,
                  ),
                _buildInfoRow(
                  'حالة الفاتورة:',
                  invoice.status.toString(),
                  baseStyle,
                  boldStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildInfoRow(
    String title,
    String value,
    pw.TextStyle baseStyle,
    pw.TextStyle boldStyle,
  ) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(title, style: baseStyle),
          pw.Text(value, style: boldStyle),
        ],
      ),
    );
  }

  // --- 3. جدول الأصناف ---
  static pw.Widget _buildItemsTable(
    InvoiceModel invoice,
    pw.TextStyle baseStyle,
    pw.TextStyle boldStyle,
  ) {
    final headers = ['الإجمالي', 'السعر', 'الكمية', 'الصنف', '#'];

    final data = invoice.items.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final item = entry.value;
      return [
        _formatCurrency(item.total),
        _formatCurrency(item.price),
        item.quantity.toString(),
        item.name,
        index.toString(),
      ];
    }).toList();

    return pw.TableHelper.fromTextArray(
      cellPadding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      headerStyle: boldStyle.copyWith(color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blueGrey700),
      cellStyle: baseStyle,
      headers: headers,
      data: data,
      columnWidths: {
        0: const pw.FlexColumnWidth(2), // Total
        1: const pw.FlexColumnWidth(2), // Price
        2: const pw.FlexColumnWidth(1.5), // Qty
        3: const pw.FlexColumnWidth(4), // Item
        4: const pw.FlexColumnWidth(0.5), // #
      },
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.center,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.center,
      },
      headerAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.center,
      },
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 1),
    );
  }

  // --- 4. الملخص ---
  static pw.Widget _buildSummary(
    InvoiceModel invoice,
    pw.TextStyle baseStyle,
    pw.TextStyle boldStyle,
  ) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        //? يمكن ترك هذا الجزء فارغاً لدفع الملخص إلى اليسار
        pw.Expanded(flex: 2, child: pw.Container()),
        // صندوق الملخص
        pw.Expanded(
          flex: 3,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildSummaryRow(
                'المجموع الفرعي:',
                _formatCurrency(invoice.subtotal),
                baseStyle,
                boldStyle,
              ),
              _buildSummaryRow(
                'الخصم:',
                '- ${_formatCurrency(invoice.discountAmount ?? 0)}',
                baseStyle,
                boldStyle,
              ),
              _buildSummaryRow(
                'الضريبة (شامل):',
                _formatCurrency(invoice.taxAmount ?? 0),
                baseStyle,
                boldStyle,
              ),
              pw.Divider(color: PdfColors.grey500),
              _buildSummaryRow(
                'الإجمالي المستحق:',
                _formatCurrency(invoice.totalAmount),
                boldStyle.copyWith(fontSize: 14, color: PdfColors.blueGrey800),
                boldStyle.copyWith(fontSize: 14, color: PdfColors.blueGrey800),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildSummaryRow(
    String title,
    String value,
    pw.TextStyle titleStyle,
    pw.TextStyle valueStyle,
  ) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3.0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(title, style: titleStyle),
          pw.Text(value, style: valueStyle),
        ],
      ),
    );
  }

  //? --- 5. الملاحظات والتذييل ---
  static pw.Widget _buildNotes(InvoiceModel invoice, pw.TextStyle baseStyle) {
    // ignore: unnecessary_null_comparison
    if (invoice.notes == null || invoice.notes.isEmpty) {
      return pw.SizedBox();
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'ملاحظات:',
          style: baseStyle.copyWith(fontWeight: pw.FontWeight.bold),
        ),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(4),
          ),
          child: pw.Text(invoice.notes, style: baseStyle),
        ),
      ],
    );
  }

  static pw.Widget _buildFooter(pw.Context context, pw.TextStyle boldStyle) {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey300),
        pw.SizedBox(height: 8),
        pw.Text(
          'شكراً لتعاملكم معنا',
          style: boldStyle.copyWith(color: PdfColors.grey600),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'صفحة ${context.pageNumber} من ${context.pagesCount}',
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey),
        ),
      ],
    );
  }

  ///? --- دالة مساعدة لتنسيق العملة ---
  static String _formatCurrency(double amount) {
    //? يمكنك استخدام حزمة intl لتنسيق العملة بشكل أفضل إذا أردت
    //? مثلاً: final format = intl.NumberFormat.simpleCurrency(locale: 'ar_SA', name: 'SAR');

    return '${amount.toStringAsFixed(2)} \$'; // كمثال
  }
}
