import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/widgets/cards/selection_card.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_cubit.dart';
import 'package:jawlati/features/invoices/logic/invoice_add_cubit/invoice_state.dart';

class ClientSelectorCard extends StatelessWidget {
  final VoidCallback onTap;

  const ClientSelectorCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        return state.when(
          initial: () => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<InvoiceCubit>().clearClient,
          ),
          loading: () => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<InvoiceCubit>().clearClient,
          ),
          loaded: (
            currentTime,
            currentDate,
            invoiceItems,
            subtotal,
            totalAmount,
            paidAmount,
            remainingAmount,
            notes,
            selectedClient,
            filteredItems,
            filteredClients,
            selectedPaymentMethod,
            availableMethods,
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
              onClear: context.read<InvoiceCubit>().clearClient,
            );
          },
          error: (message) => SelectionCard(
            title: 'العميل',
            placeholderText: 'اختيار عميل',
            icon: Icons.add,
            onTap: onTap,
            onClear: context.read<InvoiceCubit>().clearClient,
          ),
        );
      },
    );
  }
}
