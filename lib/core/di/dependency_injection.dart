import 'package:jawlati/core/storage/field_database.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:jawlati/features/home/data/apis/home_api_service.dart';
import 'package:jawlati/features/home/data/repo/home_repo.dart';
import 'package:jawlati/features/home/logic/home_cubit.dart';
import 'package:jawlati/features/invoices/data/apis/invoice_api_service.dart';
import 'package:jawlati/features/invoices/data/repo/invoice_repository.dart';
import 'package:jawlati/features/invoices/data/repo/return_invoice_repository.dart';
import 'package:jawlati/features/invoices/logic/return_invoice_add_cubit/add_return_invoice_cubit.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_cubit.dart';
import 'package:jawlati/features/invoices/logic/invoices_view_cubit/invoices_view_cubit.dart';
import 'package:jawlati/features/invoices/logic/return_invoice_details_cubit/return_invoice_details_cubit.dart';
import 'package:jawlati/features/clients/data/repo/client_repository.dart';
import 'package:jawlati/features/clients/logic/add_client_cubit/add_client_cubit.dart';
import 'package:jawlati/features/clients/logic/view_clients_cubit/view_clients_cubit.dart';
import 'package:jawlati/features/receipt/data/repo/receipt_repository.dart';
import 'package:jawlati/features/receipt/logic/add_receipt_cubit/add_receipt_cubit.dart';
import 'package:jawlati/features/receipt/logic/receipt_details_cubit/receipt_details_cubit.dart';
import 'package:jawlati/features/receipt/logic/view_receipts_cubit/view_receipts_cubit.dart';
import 'package:jawlati/features/requests/data/repo/requests_repository.dart';
import 'package:jawlati/features/requests/data/repo/requests_repository_impl.dart';
import 'package:jawlati/features/visits/data/repo/visits_repository.dart';
import 'package:jawlati/features/visits/logic/visits_cubit.dart';
import 'package:jawlati/features/inventory/data/repositories/inventory_repository.dart';
import 'package:jawlati/core/services/location_service.dart';

import '../../features/auth/data/apis/auth_api_services.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/login_cubit.dart';
import '../../features/invoices/logic/invoice_details_cubit/invoice_details_cubit.dart';
import '../../features/invoices/logic/return_invoices_view_cubit/view_return_invoices_cubit.dart';
import '../../features/requests/logic/load_request_cubit/load_request_cubit.dart';
import '../../features/requests/logic/requests_cubit/requests_cubit.dart';
import '../../features/requests/logic/sales_request_cubit/sales_request_cubit.dart';
import '../helpers/app_logger.dart';
import '../navigation/app_navigator_observer.dart';
import '../navigation/app_router.dart';
import '../networking/api_constants.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<AppNavigatorObserver>(AppNavigatorObserver());

  // Logger
  getIt.registerLazySingleton<AppLogger>(
    () => AppLogger(customOutput: MultiOutput([DeveloperConsoleOutput()])),
  );

  // * Dio Instance
  // Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.getDio(ApiConstants.apiBaseUrl),
  );

  // * login
  // LoginApiService
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );
  // LoginRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<AuthApiService>()),
  );
  // LoginCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));

  // Home
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt<HomeApiService>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // invoice feature
  getIt.registerLazySingleton<InvoiceApiService>(
    () => InvoiceApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<InvoiceRepository>(
    () => InvoiceRepositoryImpl(getIt<InvoiceApiService>()),
  );
  getIt.registerFactory<InvoiceCubit>(
    () => InvoiceCubit(getIt<InvoiceRepository>()),
  );
  getIt.registerFactory<InvoicesViewCubit>(
    () => InvoicesViewCubit(getIt<InvoiceRepository>()),
  );
  getIt.registerFactory<InvoiceDetailsCubit>(
    () => InvoiceDetailsCubit(getIt<InvoiceRepository>()),
  );

  //
  getIt.registerLazySingleton<ReturnInvoiceRepository>(
    () => ReturnInvoiceRepositoryImpl(),
  );
  getIt.registerFactory<AddReturnInvoiceCubit>(
    () => AddReturnInvoiceCubit(getIt<ReturnInvoiceRepository>()),
  );
  getIt.registerFactory<ViewReturnInvoicesCubit>(
    () => ViewReturnInvoicesCubit(getIt<ReturnInvoiceRepository>()),
  );
  getIt.registerFactory<ReturnInvoiceDetailsCubit>(
    () => ReturnInvoiceDetailsCubit(getIt<ReturnInvoiceRepository>()),
  );

  // Clients feature
  getIt.registerLazySingleton<FieldDatabase>(
    FieldDatabase.new,
    dispose: (db) => db.close(),
  );
  getIt.registerLazySingleton<ClientRepository>(
    () => ClientRepositoryImpl(getIt<FieldDatabase>()),
  );
  getIt.registerFactory<AddClientCubit>(
    () => AddClientCubit(getIt<ClientRepository>()),
  );
  getIt.registerFactory<ViewClientsCubit>(
    () => ViewClientsCubit(getIt<ClientRepository>()),
  );

  //
  getIt.registerLazySingleton<ReceiptRepository>(() => ReceiptRepositoryImpl());
  getIt.registerFactory<AddReceiptCubit>(
    () => AddReceiptCubit(getIt<ReceiptRepository>()),
  );
  getIt.registerFactory<ViewReceiptsCubit>(
    () => ViewReceiptsCubit(getIt<ReceiptRepository>()),
  );
  getIt.registerFactory<ReceiptDetailsCubit>(
    () => ReceiptDetailsCubit(getIt<ReceiptRepository>()),
  );
  //
  getIt.registerLazySingleton<RequestsRepository>(
    () => RequestsRepositoryImpl(),
  );
  getIt.registerFactory<RequestsCubit>(
    () => RequestsCubit(getIt<RequestsRepository>()),
  );
  getIt.registerFactory<LoadRequestCubit>(
    () => LoadRequestCubit(getIt<RequestsRepository>()),
  );
  getIt.registerFactory<SalesRequestCubit>(
    () => SalesRequestCubit(getIt<RequestsRepository>()),
  );

  // Visits feature
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<VisitsRepository>(
    () => VisitsRepository(
      getIt<FieldDatabase>(),
      getIt<ClientRepository>(),
      getIt<LocationService>(),
    ),
  );
  getIt.registerFactory<VisitsCubit>(
    () => VisitsCubit(getIt<VisitsRepository>()),
  );

  // Inventory feature
  getIt.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(),
  );
}
