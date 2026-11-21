class CustomerModel {
  final String customerId;
  final String customerName;
  final String accountNo;
  final String payType;
  final String salesman;
  final String allowedBalance;
  final String gpsLoc;
  final String xLoc;
  final String yLoc;
  final String allowCheques;
  final double currentBalance;
  final String clientType;
  final String mainPersonName;
  final String visitDay;
  final double clientDiscount;

  CustomerModel({
    required this.customerId,
    required this.customerName,
    required this.accountNo,
    required this.payType,
    required this.salesman,
    required this.allowedBalance,
    required this.gpsLoc,
    required this.xLoc,
    required this.yLoc,
    required this.allowCheques,
    required this.currentBalance,
    required this.clientType,
    required this.mainPersonName,
    required this.visitDay,
    required this.clientDiscount,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json['CustomerId'] ?? '',
      customerName: json['CustomerName'] ?? '',
      accountNo: json['AccountNo'] ?? '',
      payType: json['pay_type'] ?? '',
      salesman: json['salesman'] ?? '',
      allowedBalance: json['allowed_balance'] ?? '',
      gpsLoc: json['gps_loc'] ?? '',
      xLoc: json['x_loc'] ?? '',
      yLoc: json['y_loc'] ?? '',
      allowCheques: json['allow_cheques'] ?? '',
      currentBalance: (json['CurrentBalance'] ?? 0).toDouble(),
      clientType: json['client_type'] ?? '',
      mainPersonName: json['main_person_name'] ?? '',
      visitDay: json['visit_day'] ?? '',
      clientDiscount: (json['ClientDiscount'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CustomerId': customerId,
      'CustomerName': customerName,
      'AccountNo': accountNo,
      'pay_type': payType,
      'salesman': salesman,
      'allowed_balance': allowedBalance,
      'gps_loc': gpsLoc,
      'x_loc': xLoc,
      'y_loc': yLoc,
      'allow_cheques': allowCheques,
      'CurrentBalance': currentBalance,
      'client_type': clientType,
      'main_person_name': mainPersonName,
      'visit_day': visitDay,
      'ClientDiscount': clientDiscount,
    };
  }

  CustomerModel copyWith({
    String? customerId,
    String? customerName,
    String? accountNo,
    String? payType,
    String? salesman,
    String? allowedBalance,
    String? gpsLoc,
    String? xLoc,
    String? yLoc,
    String? allowCheques,
    double? currentBalance,
    String? clientType,
    String? mainPersonName,
    String? visitDay,
    double? clientDiscount,
  }) {
    return CustomerModel(
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      accountNo: accountNo ?? this.accountNo,
      payType: payType ?? this.payType,
      salesman: salesman ?? this.salesman,
      allowedBalance: allowedBalance ?? this.allowedBalance,
      gpsLoc: gpsLoc ?? this.gpsLoc,
      xLoc: xLoc ?? this.xLoc,
      yLoc: yLoc ?? this.yLoc,
      allowCheques: allowCheques ?? this.allowCheques,
      currentBalance: currentBalance ?? this.currentBalance,
      clientType: clientType ?? this.clientType,
      mainPersonName: mainPersonName ?? this.mainPersonName,
      visitDay: visitDay ?? this.visitDay,
      clientDiscount: clientDiscount ?? this.clientDiscount,
    );
  }

  @override
  String toString() {
    return 'CustomerModel('
        'customerId: $customerId, '
        'customerName: $customerName, '
        'accountNo: $accountNo, '
        'payType: $payType, '
        'salesman: $salesman, '
        'allowedBalance: $allowedBalance, '
        'gpsLoc: $gpsLoc, '
        'xLoc: $xLoc, '
        'yLoc: $yLoc, '
        'allowCheques: $allowCheques, '
        'currentBalance: $currentBalance, '
        'clientType: $clientType, '
        'mainPersonName: $mainPersonName, '
        'visitDay: $visitDay, '
        'clientDiscount: $clientDiscount'
        ')';
  }
}
