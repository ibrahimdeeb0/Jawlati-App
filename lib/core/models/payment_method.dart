import 'package:flutter/material.dart';

enum PaymentMethodType { cash, card, credit, wallet, points }

class AppPaymentMethod {
  final String displayName;
  final IconData icon;
  final PaymentMethodType type;
  final String? walletProvider; // لتحديد نوع المحفظة (e.g., 'zain_cash')

  const AppPaymentMethod({
    required this.displayName,
    required this.icon,
    required this.type,
    this.walletProvider,
  });

  static const cash = AppPaymentMethod(
    displayName: 'نقداً',
    icon: Icons.money_rounded,
    type: PaymentMethodType.cash,
  );
  static const card = AppPaymentMethod(
    displayName: 'بطاقة',
    icon: Icons.credit_card,
    type: PaymentMethodType.card,
  );
  static const credit = AppPaymentMethod(
    displayName: 'آجل (ذمم)',
    icon: Icons.receipt_long_rounded,
    type: PaymentMethodType.credit,
  );
  static const points = AppPaymentMethod(
    displayName: 'نقاط',
    icon: Icons.star_rounded,
    type: PaymentMethodType.points,
  );

  static AppPaymentMethod wallet(String providerName, String providerKey) {
    return AppPaymentMethod(
      displayName: providerName,
      icon: Icons.account_balance_wallet_rounded,
      type: PaymentMethodType.wallet,
      walletProvider: providerKey,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPaymentMethod &&
          runtimeType == other.runtimeType &&
          displayName == other.displayName &&
          type == other.type;

  @override
  int get hashCode => displayName.hashCode ^ type.hashCode;
}
