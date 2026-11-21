import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_cubit.dart';
import 'package:jawlati/features/invoices/ui/return_invoice_screens/add_return_invoice_screen.dart';
import 'package:jawlati/features/invoices/ui/invoice_screens/invoice_details_screen.dart';
import 'package:jawlati/features/invoices/ui/invoice_screens/view_invoices_screen.dart';

import '../logic/return_invoice_add_cubit/add_return_invoice_cubit.dart';
import '../logic/invoice_details_cubit/invoice_details_cubit.dart';
import '../logic/invoices_view_cubit/invoices_view_cubit.dart';
import '../logic/return_invoice_details_cubit/return_invoice_details_cubit.dart';
import '../logic/return_invoices_view_cubit/view_return_invoices_cubit.dart';
import '../ui/invoice_screens/add_invoice_screen.dart';
import '../ui/return_invoice_screens/return_invoice_details_screen.dart';
import '../ui/return_invoice_screens/view_return_invoices_screen.dart';

class InvoiceRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterConstants.addInvoice:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<InvoiceCubit>(),
            child: const AddInvoiceScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.viewInvoices:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<InvoicesViewCubit>(),
            child: const ViewInvoicesScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.invoiceDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        final invoiceId = args?['invoiceId'] as String?;

        if (invoiceId == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('معرف الفاتورة ID مطلوب'),
              ),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = getIt<InvoiceDetailsCubit>();
              cubit.loadInvoiceDetails(invoiceId);
              return cubit;
            },
            child: InvoiceDetailsScreen(invoiceId: invoiceId),
          ),
          settings: settings,
        );

      case AppRouterConstants.addReturnInvoice:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddReturnInvoiceCubit>(),
            child: const AddReturnInvoiceScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.viewReturnInvoices:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ViewReturnInvoicesCubit>(),
            child: const ViewReturnInvoicesScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.returnInvoiceDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        final invoiceId = args?['invoiceId'] as String?;

        if (invoiceId == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('معرف الفاتورة ID مطلوب'),
              ),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = getIt<ReturnInvoiceDetailsCubit>();
              cubit.loadReturnInvoiceDetails(invoiceId);
              return cubit;
            },
            child: ReturnInvoiceDetailsScreen(invoiceId: invoiceId),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('خطأ في التنقل'),
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'الصفحة غير موجودة',
                    style: AppTextStyles.heading20BlackBold,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'لا يمكن العثور على: ${settings.name}',
                    style: AppTextStyles.body14GrayRegular,
                  ),
                  const SizedBox(height: 24),
                  // ElevatedButton(
                  //   // ignore: no_wildcard_variable_uses
                  //   onPressed: () => Navigator.pop(_),
                  //   child: const Text('العودة'),
                  // ),
                ],
              ),
            ),
          ),
          settings: settings,
        );
    }
  }
}
