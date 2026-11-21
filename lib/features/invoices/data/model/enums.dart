enum ClientType { retail, wholesale, distributor }

// enum PaymentMethod { cash, card, later, checks, other }

enum InvoiceStatus { draft, confirmed, paid, cancelled, partial }

enum InvoiceFilter { all }

enum InvoiceSortBy { date, amount, client }

enum ReturnReason {
  damaged('سلعة تالفة'),
  expired('منتهية الصلاحية'),
  wrongItem('سلعة خاطئة'),
  customerRequest('طلب العميل'),
  qualityIssue('مشكلة في الجودة'),
  overstock('فائض مخزون'),
  other('أخرى');

  const ReturnReason(this.displayName);
  final String displayName;
}

enum ReturnInvoiceStatus {
  draft('مسودة'),
  confirmed('مؤكدة'),
  processed('تم المعالجة'),
  cancelled('ملغية');

  const ReturnInvoiceStatus(this.displayName);
  final String displayName;
}

enum ReturnInvoiceFilter {
  all('الكل'),
  processed('تم المعالجة'),
  pending('في الانتظار'),
  cancelled('ملغية');

  const ReturnInvoiceFilter(this.displayName);
  final String displayName;
}

enum ReturnInvoiceSortBy {
  date('التاريخ'),
  amount('المبلغ'),
  client('العميل');

  const ReturnInvoiceSortBy(this.displayName);
  final String displayName;
}
