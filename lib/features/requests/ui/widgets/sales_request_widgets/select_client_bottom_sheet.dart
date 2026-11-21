import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:jawlati/features/requests/logic/sales_request_cubit/sales_request_state.dart';

import '../../../logic/sales_request_cubit/sales_request_cubit.dart';

class SelectClientSheet extends StatelessWidget {
  const SelectClientSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [16.spacingVertical, _buildClientsList(), 16.spacingVertical],
    );
  }

  Widget _buildClientsList() {
    return Flexible(
      child: BlocBuilder<SalesRequestCubit, SalesRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded:
                (
                  date,
                  items,
                  subtotal,
                  discount,
                  totalAmount,
                  notes,
                  filteredClients,
                  selectedClient,
                  filteredItems,
                  selectedItem,
                ) {
                  final cubit = context.read<SalesRequestCubit>();

                  final clients = filteredClients ?? cubit.allClients;

                  final TextEditingController searchController =
                      cubit.clientSearchController;

                  if (clients.isEmpty) {
                    return _buildEmptyState(searchController.text);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      final isSelected = selectedClient?.id == client.id;
                      return _buildClientCard(context, client, isSelected);
                    },
                  );
                },
            error: (message) => _buildErrorState(context, message),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildClientCard(
    BuildContext context,
    Client client,
    bool isSelected,
  ) {
    return SelectableListCard(
      title: client.name,
      subtitle: client.phone,
      leadingIcon: Icons.phone_outlined,
      isSelected: isSelected,
      onTap: () {
        context.read<SalesRequestCubit>().selectClient(client);
        Navigator.of(context).pop();
      },
      margin: EdgeInsets.only(bottom: 12.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    );
  }

  Widget _buildEmptyState(String? searchQuery) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          Icon(Icons.people_outline, size: 64.r, color: AppColors.gray),
          16.spacingVertical,
          Text('لا يوجد عملاء', style: AppTextStyles.body16GrayMedium),
          if (searchQuery != null && searchQuery.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Text(
              'لم يتم العثور على عملاء تطابق "$searchQuery"',
              style: AppTextStyles.caption12GrayMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Padding(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 64.r, color: Colors.red),
          SizedBox(height: 16.h),
          Text('حدث خطأ', style: AppTextStyles.body16GrayMedium),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTextStyles.caption12GrayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () =>
                context.read<SalesRequestCubit>().searchClients(''),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}
