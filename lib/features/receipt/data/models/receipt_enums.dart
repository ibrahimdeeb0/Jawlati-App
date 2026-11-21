enum ReceiptType { 
  cash('نقدي'),
  cheque('شيك'),
  bankTransfer('تحويل بنكي'),
  creditCard('بطاقة ائتمان'),
  other('أخرى');

  const ReceiptType(this.displayName);
  final String displayName;
}

enum ReceiptStatus {
  draft('مسودة'),
  confirmed('مؤكد'),
  cancelled('ملغي');

  const ReceiptStatus(this.displayName);
  final String displayName;
}

enum ReceiptFilter {
  all('الكل'),
  confirmed('مؤكد'),
  draft('مسودات'),
  cancelled('ملغية');

  const ReceiptFilter(this.displayName);
  final String displayName;
}

enum ReceiptSortBy {
  date('التاريخ'),
  amount('المبلغ'),
  client('العميل');

  const ReceiptSortBy(this.displayName);
  final String displayName;
}