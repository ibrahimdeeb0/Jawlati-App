import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/sales_request_cubit/sales_request_cubit.dart';
import '../../../logic/sales_request_cubit/sales_request_state.dart';

class ClientSelectorCard extends StatelessWidget {
  final VoidCallback onTap;

  const ClientSelectorCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesRequestCubit, SalesRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<SalesRequestCubit>().clearClient,
          ),
          loading: () => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<SalesRequestCubit>().clearClient,
          ),
          loaded: (
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
            return SelectionCard(
              title: 'العميل',
              placeholderText: 'اختيار عميل',
              icon: Icons.add,
              onTap: onTap,
              isSelected: selectedClient != null,
              selectedItemName:
                  selectedClient != null ? selectedClient.name : '',
              selectedItemSubtitle:
                  selectedClient != null ? selectedClient.address : '',
              onClear: context.read<SalesRequestCubit>().clearClient,
            );
          },
          error: (message) => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<SalesRequestCubit>().clearClient,
          ),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}



// class ClientSelectorCard extends StatelessWidget {
//   const ClientSelectorCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SectionCard(
//       title: 'اختيار العميل',
//       child: BlocBuilder<SalesRequestCubit, SalesRequestState>(
//         builder: (context, state) {
//           return GestureDetector(
//             onTap: () => _showClientsBottomSheet(context),
//             child: Container(
//               padding: EdgeInsets.all(16.r),
//               decoration: BoxDecoration(
//                 color: AppColors.lightOrange.colorWithOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12.r),
//                 border: Border.all(
//                   color: AppColors.mainOrange,
//                   style: BorderStyle.solid,
//                   width: 1.5,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(8.r),
//                     decoration: BoxDecoration(
//                       color: AppColors.mainOrange.colorWithOpacity(0.2),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: Icon(
//                       Icons.person_add,
//                       color: AppColors.mainOrange,
//                       size: 20.r,
//                     ),
//                   ),
//                   SizedBox(width: 12.w),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'اختيار العميل',
//                           style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
//                             color: AppColors.mainOrange,
//                           ),
//                         ),
//                         SizedBox(height: 4.h),
//                         Text(
//                           'اختر العميل الذي تريد إنشاء الطلب له',
//                           style: AppTextStyles.caption12GrayMedium,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: AppColors.mainOrange,
//                     size: 16.r,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // void _showClientSelector(BuildContext context) {
//   //   // This would show the client selection bottom sheet
//   //   // For now, just show a placeholder
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     const SnackBar(
//   //       content: Text('سيتم تنفيذ اختيار العميل قريباً'),
//   //     ),
//   //   );
//   // }

//   void _showClientsBottomSheet(BuildContext context) {
//     final cubit = context.read<SalesRequestCubit>();

//     AppBottomSheet.showCustomModal(
//       context: context,
//       searchFieldParameters: SearchFieldParameters(
//         controller: cubit.clientSearchController,
//         hintText: 'ابحث عن عميل',
//         onChanged: cubit.searchClients,
//       ),
//       title: 'اختيار العميل',
//       content: BlocProvider.value(
//         value: cubit,
//         child: SelectClientSheet(),
//       ),
//     );
//   }
// }

