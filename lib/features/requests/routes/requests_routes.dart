import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import '../../../core/navigation/app_router_constants.dart';

import '../logic/requests_cubit/requests_cubit.dart';
import '../logic/load_request_cubit/load_request_cubit.dart';
import '../logic/sales_request_cubit/sales_request_cubit.dart';
import '../ui/my_requests/my_requests_screen.dart';
import '../ui/add_load_request/add_load_request_screen.dart';
import '../ui/add_sales_request/add_sales_request_screen.dart';
import '../ui/request_details/request_details_screen.dart';

class RequestsRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterConstants.myRequests:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RequestsCubit>(),
            child: const MyRequestsScreen(),
          ),
        );

      case AppRouterConstants.addLoadRequest:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoadRequestCubit>(),
            child: const AddLoadRequestScreen(),
          ),
        );

      case AppRouterConstants.addSalesRequest:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SalesRequestCubit>(),
            child: const AddSalesRequestScreen(),
          ),
        );

      case AppRouterConstants.requestDetails:
        final request = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => RequestDetailsScreen(
            request: request,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
