import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';

import '../logic/add_receipt_cubit/add_receipt_cubit.dart';
import '../logic/view_receipts_cubit/view_receipts_cubit.dart';
import '../logic/receipt_details_cubit/receipt_details_cubit.dart';
import '../ui/add_receipt/add_receipt_screen.dart';
import '../ui/view_receipts/view_receipts_screen.dart';
import '../ui/receipt_details/receipt_details_screen.dart';

class ReceiptRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterConstants.addReceipt:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AddReceiptCubit>(),
            child: const AddReceiptScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.viewReceipts:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ViewReceiptsCubit>(),
            child: const ViewReceiptsScreen(),
          ),
          settings: settings,
        );

      case AppRouterConstants.receiptDetails:
        final receiptId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ReceiptDetailsCubit>(),
            child: ReceiptDetailsScreen(receiptId: receiptId),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
