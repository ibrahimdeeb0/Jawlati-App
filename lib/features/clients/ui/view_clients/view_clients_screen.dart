import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/models/payment_method.dart';

import 'package:jawlati/core/widgets/index.dart';

import '../../data/models/client_model.dart';
import '../../logic/view_clients_cubit/view_clients_cubit.dart';
import '../../logic/view_clients_cubit/view_clients_state.dart';
import '../widgets/client_card.dart';
import '../widgets/client_filter_options.dart';

class ViewClientsScreen extends StatelessWidget {
  const ViewClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            const _SearchBar(),
            Expanded(
              child: BlocBuilder<ViewClientsCubit, ViewClientsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(child: Text('جاري التحضير...')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (clients, filtered, _) =>
                        _ClientListView(clients: filtered),
                    error: (message) => _ErrorState(message: message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyAppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: 'العملاء',
      actions: [
        AppIconActionButton(
          icon: Icons.add,
          onPressed: () async {
            final result = await context.pushNamed(
              AppRouterConstants.addClient,
            );

            if (result == true) {
              // ignore: use_build_context_synchronously
              context.read<ViewClientsCubit>().refreshClients();
            }
          },
        ),
        AppIconActionButton(
          icon: Icons.filter_list,
          onPressed: () => _showFilterOptions(context),
        ),
      ],
    );
  }

  void _showFilterOptions(BuildContext context) {
    final cubit = context.read<ViewClientsCubit>();

    AppBottomSheet.showModal(
      context: context,
      content: BlocProvider.value(
        value: cubit,
        child: ClientFilterOptions(
          onFilterByType: (type) {
            cubit.filterByType(type);
            Navigator.pop(context);
          },
          onSortBy: (sortBy) {
            cubit.sortClients(sortBy);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewClientsCubit, ViewClientsState>(
      builder: (context, state) {
        final searchQuery = state.maybeWhen(
          loaded: (_, __, searchQuery) => searchQuery ?? '',
          orElse: () => '',
        );

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 14.h),
          child: TextFieldSearchBar(
            searchHint: 'البحث في العملاء...',
            searchQuery: searchQuery,
            onSearchChanged: (query) {
              context.read<ViewClientsCubit>().searchClients(query);
            },
          ),
        );
      },
    );
  }
}

class _ClientListView extends StatelessWidget {
  final List<Client> clients;
  const _ClientListView({required this.clients});

  @override
  Widget build(BuildContext context) {
    if (clients.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.people_outline,
        title: 'لا توجد عملاء',
        subtitle: 'لم يتم العثور على عملاء مطابقين لبحثك',
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ViewClientsCubit>().refreshClients(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return ClientCard(
            client: client,
            onEdit: () => _onEdit(context, client),
            onDelete: () => _onDelete(context, client),
            // onTap: () => _onView(context, client),
            lastOrderDate: _getLastOrderDate(client),
            availablePaymentMethods: _getAvailablePaymentMethods(client),
          );
        },
      ),
    );
  }

  void _onEdit(BuildContext context, Client client) {
    // TODO: Navigate to edit screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تحرير العميل قريباً')));
  }

  void _onDelete(BuildContext context, Client client) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف العميل "${client.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<ViewClientsCubit>().deleteClient(client.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  // void _onView(BuildContext context, Client client) {
  //   // TODO: Navigate to details screen
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('تفاصيل العميل: ${client.name}')),
  //   );
  // }

  String? _getLastOrderDate(Client client) {
    // TODO: يجب استبدال هذا بالتاريخ الفعلي من قاعدة البيانات
    return '23/08';
  }

  List<AppPaymentMethod> _getAvailablePaymentMethods(Client client) {
    // تحديد طرق الدفع المتاحة بناءً على نوع العميل
    List<AppPaymentMethod> methods = [
      AppPaymentMethod.cash,
      AppPaymentMethod.card,
    ];

    // العملاء الشركات يمكنهم الشراء بالآجل
    if (client.type == ClientType.company) {
      methods.add(AppPaymentMethod.credit);
    }

    // جميع العملاء يمكنهم استخدام المحافظ الإلكترونية
    methods.add(AppPaymentMethod.wallet('زين كاش', 'zain_cash'));

    return methods;
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade400),
          16.verticalSpace,
          Text(
            message,
            style: AppTextStyles.body16DarkBlueSemiBold,
            textAlign: TextAlign.center,
          ),
          16.verticalSpace,
          ElevatedButton(
            onPressed: () => context.read<ViewClientsCubit>().loadClients(),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
