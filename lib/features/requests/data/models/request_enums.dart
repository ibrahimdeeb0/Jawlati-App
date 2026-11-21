enum RequestType {
  load('load'),
  sales('sales');

  const RequestType(this.value);
  final String value;

  static RequestType fromString(String value) {
    return RequestType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RequestType.load,
    );
  }
}

enum RequestStatus {
  pending('pending'),
  approved('approved'),
  rejected('rejected'),
  delivered('delivered');

  const RequestStatus(this.value);
  final String value;

  static RequestStatus fromString(String value) {
    return RequestStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => RequestStatus.pending,
    );
  }

  String get displayName {
    switch (this) {
      case RequestStatus.pending:
        return 'قيد المراجعة';
      case RequestStatus.approved:
        return 'تمت الموافقة';
      case RequestStatus.rejected:
        return 'مرفوض';
      case RequestStatus.delivered:
        return 'تم التسليم';
    }
  }
}