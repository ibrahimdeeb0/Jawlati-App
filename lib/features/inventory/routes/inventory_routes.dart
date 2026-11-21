import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/navigation/app_router_constants.dart';
import '../ui/inventory_quantities_screen.dart';
import '../ui/inventory_audit_screen.dart';
import '../logic/inventory_cubit.dart';
import '../data/repositories/inventory_repository.dart';

class InventoryRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterConstants.inventoryQuantities:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InventoryCubit(getIt<InventoryRepository>()),
            child: const InventoryQuantitiesScreen(),
          ),
        );
        
      case AppRouterConstants.inventoryAudit:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InventoryCubit(getIt<InventoryRepository>()),
            child: const InventoryAuditScreen(),
          ),
        );
        
      default:
        return null;
    }
  }
}