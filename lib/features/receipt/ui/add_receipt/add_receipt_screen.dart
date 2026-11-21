import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/toast_helper.dart';

import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/core/widgets/layout/my_app_bar.dart';

import '../../logic/add_receipt_cubit/add_receipt_cubit.dart';
import '../../logic/add_receipt_cubit/add_receipt_state.dart';
import '../../data/models/receipt_enums.dart';
import '../widgets/add_receipt_widgets/receipt_header_card.dart';
import '../widgets/add_receipt_widgets/client_selector_card.dart';
import '../widgets/add_receipt_widgets/payment_type_card.dart';
import '../widgets/add_receipt_widgets/amount_input_card.dart';
import '../widgets/add_receipt_widgets/cheque_details_card.dart';
import '../widgets/add_receipt_widgets/notes_input_card.dart';
import '../widgets/add_receipt_widgets/save_receipt_button.dart';

class AddReceiptScreen extends StatelessWidget {
  const AddReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddReceiptCubit, AddReceiptState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (
            currentTime,
            currentDate,
            amount,
            notes,
            selectedClient,
            filteredClients,
            receiptType,
            chequeNumber,
            bankName,
            chequeMaturityDate,
          ) {},
          success: (message) {
            ToastHelper.showToast(message: message, type: ToastType.success);
          },
          error: (message) {
            ToastHelper.showToast(message: message, type: ToastType.error);
          },
        );
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: MyAppBar(
              title: 'إنشاء سند قبض',
              // onBackPressed: () => Navigator.of(context).pop(),
            ),
            body: state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (
                currentTime,
                currentDate,
                amount,
                notes,
                selectedClient,
                filteredClients,
                receiptType,
                chequeNumber,
                bankName,
                chequeMaturityDate,
              ) =>
                  _buildLoadedBody(
                context,
                currentTime,
                currentDate,
                amount,
                notes,
                selectedClient,
                filteredClients,
                receiptType,
                chequeNumber,
                bankName,
                chequeMaturityDate,
              ),
              success: (message) =>
                  const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    20.spacingVertical,
                    ElevatedButton(
                      onPressed: () =>
                          context.read<AddReceiptCubit>().resetForm(),
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadedBody(
    BuildContext context,
    String currentTime,
    String currentDate,
    double amount,
    String notes,
    selectedClient,
    filteredClients,
    ReceiptType receiptType,
    String? chequeNumber,
    String? bankName,
    DateTime? chequeMaturityDate,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          ReceiptHeaderCard(
            currentTime: currentTime,
            currentDate: currentDate,
          ),
          16.spacingVertical,
          ClientSelectorCard(
            selectedClient: selectedClient,
            filteredClients: filteredClients ?? [],
            onClientSelected: (client) {
              context.read<AddReceiptCubit>().selectClient(client);
            },
            onSearch: (query) {
              context.read<AddReceiptCubit>().filterClients(query);
            },
          ),
          16.spacingVertical,
          PaymentTypeCard(
            selectedType: receiptType,
            onTypeSelected: (type) {
              context.read<AddReceiptCubit>().selectReceiptType(type);
            },
          ),
          16.spacingVertical,
          AmountInputCard(
            amount: amount,
            onAmountChanged: (newAmount) {
              context.read<AddReceiptCubit>().updateAmount(newAmount);
            },
          ),
          if (receiptType == ReceiptType.cheque) ...[
            16.spacingVertical,
            ChequeDetailsCard(
              chequeNumber: chequeNumber,
              bankName: bankName,
              maturityDate: chequeMaturityDate,
              onChequeNumberChanged: (number) {
                context.read<AddReceiptCubit>().updateChequeDetails(
                      chequeNumber: number,
                    );
              },
              onBankNameChanged: (bank) {
                context.read<AddReceiptCubit>().updateChequeDetails(
                      bankName: bank,
                    );
              },
              onMaturityDateChanged: (date) {
                context.read<AddReceiptCubit>().updateChequeDetails(
                      maturityDate: date,
                    );
              },
            ),
          ],
          16.spacingVertical,
          NotesInputCard(
            notes: notes,
            onNotesChanged: (newNotes) {
              context.read<AddReceiptCubit>().updateNotes(newNotes);
            },
          ),
          32.spacingVertical,
          SaveReceiptButton(
            onPressed: () {
              context.read<AddReceiptCubit>().saveReceipt();
            },
          ),
          32.spacingVertical,
        ],
      ),
    );
  }
}
