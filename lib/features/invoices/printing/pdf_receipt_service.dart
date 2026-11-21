import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart'; // افترضت وجود هذا الملف
import 'package:jawlati/core/theme/assets_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/model/invoice/invoice_model.dart';

class PdfReceiptService {
  static Future<Uint8List> buildReceiptPdf({
    required InvoiceModel invoice,
  }) async {
    final doc = pw.Document();

    //? --- تعريف أبعاد الصفحة (80mm) ---
    //? عرض الورق 80 مم. نحولها إلى نقاط (points) حيث 1 مم = 2.83 نقطة تقريباً.
    const double paperWidth = 80 * (72 / 25.4);
    //? الطول يمكن أن يكون كبيراً، والمحتوى سيحدد الطول الفعلي.
    const double paperHeight = 800 * (72 / 25.4);
    final pageFormat = PdfPageFormat(
      paperWidth,
      paperHeight,
      marginAll: 5 * (72 / 25.4), // هامش 5 مم من كل الجوانب
    );

    //? --- تحميل الخطوط ---
    final arabicFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/tajawal/Tajawal-Regular.ttf'),
    );
    final arabicFontBold = pw.Font.ttf(
      await rootBundle.load('assets/fonts/tajawal/Tajawal-Bold.ttf'),
    );

    //? يمكن إضافة خط خاص بالطابعات الحرارية إذا أردت
    //? final monoFont = pw.Font.ttf(await rootBundle.load('assets/fonts/RobotoMono-Regular.ttf'));

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

    doc.addPage(
      pw.Page(
        pageFormat: pageFormat,
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicFontBold),
        build: (context) {
          return pw.SizedBox(
            width: double.infinity,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                // 1. رأس الإيصال
                _buildHeader(invoice, arabicFontBold, companyLogo),
                pw.SizedBox(height: 10),

                // 2. معلومات الفاتورة
                _buildInfo(invoice, arabicFont),
                _buildDashedDivider(),

                // 3. الأصناف
                _buildItems(invoice, arabicFont, arabicFontBold),
                _buildDashedDivider(),

                // 4. الإجماليات
                _buildTotals(invoice, arabicFont, arabicFontBold),
                _buildDashedDivider(),

                // 5. تذييل الإيصال
                _buildFooter(invoice, arabicFont),
              ],
            ),
          );
        },
      ),
    );

    return doc.save();
  }

  // --- 1. رأس الإيصال ---
  static pw.Widget _buildHeader(
    InvoiceModel invoice,
    pw.Font boldFont,
    pw.ImageProvider? companyLogo,
  ) {
    return pw.Column(
      children: [
        // يمكنك وضع شعار بسيط هنا إذا كانت الطابعة تدعم الصور
        if (companyLogo != null)
          pw.Container(width: 40, height: 40, child: pw.Image(companyLogo)),
        pw.Text(
          'شركة توزيع تجريبية',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(font: boldFont, fontSize: 12),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          'فاتورة مبيعات',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(fontSize: 8),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'غزة - فلسطين | هاتف: +97059XXXXXXX',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(fontSize: 7),
        ),
      ],
    );
  }

  // --- 2. معلومات الفاتورة ---
  static pw.Widget _buildInfo(InvoiceModel invoice, pw.Font baseFont) {
    final style = pw.TextStyle(font: baseFont, fontSize: 8, height: 1.5);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('رقم الفاتورة:', style: style),
            pw.Text(invoice.invoiceNumber ?? invoice.id, style: style),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('التاريخ:', style: style),
            pw.Text(
              DateTimeHelper.formatInvoiceDate(invoice.createdAt),
              style: style,
            ),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('العميل:', style: style),
            pw.Text(invoice.clientName, style: style),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('المندوب:', style: style),
            pw.Text(
              'غير محدد',
              // invoice.salesRepName ?? 'غير محدد',
              style: style,
            ),
          ],
        ),
      ],
    );
  }

  // --- 3. قائمة الأصناف ---
  static pw.Widget _buildItems(
    InvoiceModel invoice,
    pw.Font baseFont,
    pw.Font boldFont,
  ) {
    final headerStyle = pw.TextStyle(font: boldFont, fontSize: 8);
    final itemStyle = pw.TextStyle(font: baseFont, fontSize: 8);

    return pw.Column(
      children: [
        //? table header
        pw.Row(
          children: [
            pw.Expanded(
              flex: 4,
              child: pw.Text(
                'الصنف',
                style: headerStyle,
                textAlign: pw.TextAlign.right,
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Text(
                'كمية',
                style: headerStyle,
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Text(
                'مبلغ',
                style: headerStyle,
                textAlign: pw.TextAlign.left,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Divider(color: PdfColors.black, height: 1),
        pw.SizedBox(height: 4),
        // الأصناف
        ...invoice.items.map((item) {
          return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2.0),
            child: pw.Column(
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child: pw.Text(
                        item.name,
                        style: itemStyle,
                        textAlign: pw.TextAlign.right,
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Text(
                        item.quantity.toString(),
                        style: itemStyle,
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        _formatCurrency(item.total),
                        style: itemStyle,
                        textAlign: pw.TextAlign.left,
                      ),
                    ),
                  ],
                ),
                // لإظهار السعر الفردي تحت اسم الصنف
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Text(
                        '(${_formatCurrency(item.price)} للسعر الفردي)',
                        style: pw.TextStyle(
                          fontSize: 7,
                          color: PdfColors.grey700,
                        ),
                        textAlign: pw.TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // --- 4. الإجماليات ---
  static pw.Widget _buildTotals(
    InvoiceModel invoice,
    pw.Font baseFont,
    pw.Font boldFont,
  ) {
    final baseStyle = pw.TextStyle(font: baseFont, fontSize: 8);
    final boldStyle = pw.TextStyle(font: boldFont, fontSize: 9);

    return pw.Column(
      children: [
        _buildTotalRow(
          'المجموع الفرعي:',
          _formatCurrency(invoice.subtotal),
          baseStyle,
        ),
        _buildTotalRow(
          'الخصم:',
          '- ${_formatCurrency(invoice.discountAmount ?? 0.0)}',
          baseStyle,
        ),
        pw.SizedBox(height: 5),
        _buildTotalRow(
          'الإجمالي النهائي:',
          _formatCurrency(invoice.totalAmount),
          boldStyle.copyWith(fontSize: 12),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'شامل ضريبة القيمة المضافة: ${_formatCurrency(invoice.taxAmount ?? 0.0)}',
          style: pw.TextStyle(fontSize: 7, font: baseFont),
        ),
      ],
    );
  }

  static pw.Widget _buildTotalRow(
    String title,
    String value,
    pw.TextStyle style,
  ) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(title, style: style),
        pw.Text(value, style: style),
      ],
    );
  }

  //? --- 5. التذييل ---
  static pw.Widget _buildFooter(InvoiceModel invoice, pw.Font baseFont) {
    return pw.Column(
      children: [
        pw.Text(
          'شكراً لتعاملكم معنا',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(font: baseFont, fontSize: 9),
        ),
        pw.SizedBox(height: 5),
        // يمكنك إضافة باركود لرقم الفاتورة
        pw.Container(
          height: 30,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.code128(),
            data: invoice.invoiceNumber ?? invoice.id,
            drawText: false,
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          invoice.invoiceNumber ?? invoice.id,
          style: pw.TextStyle(fontSize: 7),
        ),
      ],
    );
  }

  //? --- أدوات مساعدة ---
  static pw.Widget _buildDashedDivider() {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Divider(
        height: 1,
        borderStyle: pw.BorderStyle.dashed,
        color: PdfColors.black,
      ),
    );
  }

  static String _formatCurrency(double amount) {
    return '${amount.toStringAsFixed(2)} \$';
  }
}
