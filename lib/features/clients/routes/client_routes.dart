import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/features/clients/logic/add_client_cubit/add_client_cubit.dart';
import '../logic/view_clients_cubit/view_clients_cubit.dart';
import '../ui/add_client/add_client_screen.dart';
import '../ui/view_clients/view_clients_screen.dart';

class ClientRoutes {
  static const String addClient = '/add_client';
  static const String viewClients = '/view_clients';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addClient:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddClientCubit>(),
            child: const AddClientScreen(),
          ),
          settings: settings,
        );

      case viewClients:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ViewClientsCubit>(),
            child: const ViewClientsScreen(),
          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
