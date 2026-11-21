import 'package:flutter/material.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';

class InvoiceNavigator {
  static Future<void> navigateToAddInvoice(BuildContext context) {
    return context.pushNamed(AppRouterConstants.addInvoice);
  }

  static Future<void> navigateToViewInvoices(BuildContext context) {
    return context.pushNamed(AppRouterConstants.viewInvoices);
  }

  static Future<void> navigateToInvoiceDetails(
    BuildContext context,
    String invoiceId,
  ) {
    return context.pushNamed(
      AppRouterConstants.invoiceDetails,
      arguments: {'invoiceId': invoiceId},
    );
  }

  // للعودة مع result
  static void popWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
