import 'package:flutter/material.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/features/clients/routes/client_routes.dart';
import 'package:jawlati/features/home/routes/home_router.dart';
import 'package:jawlati/features/invoices/routes/invoice_routes.dart';
import 'package:jawlati/features/receipt/routes/receipt_routes.dart';
import 'package:jawlati/features/requests/routes/requests_routes.dart';
import 'package:jawlati/features/inventory/routes/inventory_routes.dart';

import '../../features/auth/routes/auth_route.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    if (settings.name == AppRouterConstants.loginRouter) {
      return AuthRoutes.generateRoute(settings);
    }

    if (settings.name == AppRouterConstants.homeRouter) {
      return HomeRoutes.generateRoute(settings);
    }

    if ((settings.name == AppRouterConstants.addInvoice) ||
        (settings.name == AppRouterConstants.viewInvoices) ||
        (settings.name == AppRouterConstants.invoiceDetails) ||
        (settings.name == AppRouterConstants.addReturnInvoice) ||
        (settings.name == AppRouterConstants.viewReturnInvoices) ||
        (settings.name == AppRouterConstants.returnInvoiceDetails)) {
      return InvoiceRoutes.generateRoute(settings);
    }

    if ((settings.name == AppRouterConstants.addClient) ||
        (settings.name == AppRouterConstants.viewClients)) {
      return ClientRoutes.generateRoute(settings);
    }

    if ((settings.name == AppRouterConstants.receipt) ||
        (settings.name == AppRouterConstants.addReceipt) ||
        (settings.name == AppRouterConstants.viewReceipts) ||
        (settings.name == AppRouterConstants.receiptDetails)) {
      return ReceiptRoutes.generateRoute(settings);
    }

    if ((settings.name == AppRouterConstants.myRequests) ||
        (settings.name == AppRouterConstants.addLoadRequest) ||
        (settings.name == AppRouterConstants.addSalesRequest) ||
        (settings.name == AppRouterConstants.requestDetails)) {
      return RequestsRoutes.generateRoute(settings);
    }

    if ((settings.name == AppRouterConstants.inventoryQuantities) ||
        (settings.name == AppRouterConstants.inventoryAudit)) {
      return InventoryRoutes.generateRoute(settings);
    }

    // Default: Undefined Route
    return null;
  }
}
