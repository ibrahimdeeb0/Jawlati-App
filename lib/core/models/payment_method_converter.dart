import 'package:json_annotation/json_annotation.dart';
import 'payment_method.dart';

class PaymentMethodConverter
    implements JsonConverter<AppPaymentMethod, Map<String, dynamic>> {
  const PaymentMethodConverter();

  @override
  AppPaymentMethod fromJson(Map<String, dynamic> json) {
    final type = PaymentMethodType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => PaymentMethodType.cash,
    );

    switch (type) {
      case PaymentMethodType.cash:
        return AppPaymentMethod.cash;
      case PaymentMethodType.card:
        return AppPaymentMethod.card;
      case PaymentMethodType.credit:
        return AppPaymentMethod.credit;
      case PaymentMethodType.points:
        return AppPaymentMethod.points;
      case PaymentMethodType.wallet:
        return AppPaymentMethod.wallet(
          json['displayName'] as String,
          json['walletProvider'] as String,
        );
    }
  }

  @override
  Map<String, dynamic> toJson(AppPaymentMethod object) {
    final json = <String, dynamic>{'type': object.type.name};
    if (object.type == PaymentMethodType.wallet) {
      json['displayName'] = object.displayName;
      json['walletProvider'] = object.walletProvider;
    }
    return json;
  }
}
